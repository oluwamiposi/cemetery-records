;; burial-recorder
;; Manages cemetery records with genealogical search capabilities and plot ownership tracking

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-plot-occupied (err u102))
(define-constant err-unauthorized (err u103))
(define-constant err-invalid-date (err u104))

;; Data variables
(define-data-var next-burial-id uint u1)
(define-data-var next-plot-id uint u1)
(define-data-var total-burials uint u0)
(define-data-var total-plots uint u0)

;; Data maps
(define-map burial-records
  { burial-id: uint }
  {
    deceased-name: (string-utf8 100),
    birth-date: (string-ascii 20),
    death-date: (string-ascii 20),
    burial-date: (string-ascii 20),
    plot-id: uint,
    relationship-notes: (string-utf8 300),
    memorial-inscription: (string-utf8 500),
    recorded-by: principal,
    record-date: uint
  }
)

(define-map plots
  { plot-id: uint }
  {
    section: (string-ascii 20),
    lot-number: (string-ascii 20),
    plot-number: (string-ascii 20),
    plot-type: (string-ascii 50),
    occupied: bool,
    owner: (optional principal),
    purchase-date: (optional uint),
    price-paid: uint
  }
)

(define-map family-connections
  { burial-id: uint, relative-burial-id: uint }
  {
    relationship-type: (string-ascii 50),
    notes: (string-utf8 200)
  }
)

(define-map genealogy-index
  { surname: (string-ascii 50) }
  {
    burial-count: uint,
    first-recorded: uint,
    last-recorded: uint
  }
)

(define-map plot-transfers
  { plot-id: uint, transfer-id: uint }
  {
    from-owner: (optional principal),
    to-owner: principal,
    transfer-date: uint,
    transfer-price: uint
  }
)

;; Read-only functions
(define-read-only (get-burial-record (burial-id uint))
  (map-get? burial-records { burial-id: burial-id })
)

(define-read-only (get-plot (plot-id uint))
  (map-get? plots { plot-id: plot-id })
)

(define-read-only (get-family-connection (burial-id uint) (relative-burial-id uint))
  (map-get? family-connections { burial-id: burial-id, relative-burial-id: relative-burial-id })
)

(define-read-only (get-genealogy-data (surname (string-ascii 50)))
  (map-get? genealogy-index { surname: surname })
)

(define-read-only (get-plot-transfer (plot-id uint) (transfer-id uint))
  (map-get? plot-transfers { plot-id: plot-id, transfer-id: transfer-id })
)

(define-read-only (is-plot-available (plot-id uint))
  (match (map-get? plots { plot-id: plot-id })
    plot (ok (not (get occupied plot)))
    err-not-found
  )
)

(define-read-only (get-total-burials)
  (ok (var-get total-burials))
)

(define-read-only (get-total-plots)
  (ok (var-get total-plots))
)

;; Public functions
(define-public (create-plot
    (section (string-ascii 20))
    (lot-number (string-ascii 20))
    (plot-number (string-ascii 20))
    (plot-type (string-ascii 50))
    (price-paid uint)
  )
  (let ((plot-id (var-get next-plot-id)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set plots
      { plot-id: plot-id }
      {
        section: section,
        lot-number: lot-number,
        plot-number: plot-number,
        plot-type: plot-type,
        occupied: false,
        owner: none,
        purchase-date: none,
        price-paid: price-paid
      })
    (var-set next-plot-id (+ plot-id u1))
    (var-set total-plots (+ (var-get total-plots) u1))
    (ok plot-id))
)

(define-public (purchase-plot (plot-id uint) (buyer principal))
  (let ((plot (unwrap! (map-get? plots { plot-id: plot-id }) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (not (get occupied plot)) err-plot-occupied)
    (map-set plots
      { plot-id: plot-id }
      (merge plot {
        owner: (some buyer),
        purchase-date: (some burn-block-height)
      }))
    (ok true))
)

(define-public (record-burial
    (deceased-name (string-utf8 100))
    (birth-date (string-ascii 20))
    (death-date (string-ascii 20))
    (burial-date (string-ascii 20))
    (plot-id uint)
    (relationship-notes (string-utf8 300))
    (memorial-inscription (string-utf8 500))
  )
  (let 
    (
      (burial-id (var-get next-burial-id))
      (plot (unwrap! (map-get? plots { plot-id: plot-id }) err-not-found))
    )
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set burial-records
      { burial-id: burial-id }
      {
        deceased-name: deceased-name,
        birth-date: birth-date,
        death-date: death-date,
        burial-date: burial-date,
        plot-id: plot-id,
        relationship-notes: relationship-notes,
        memorial-inscription: memorial-inscription,
        recorded-by: tx-sender,
        record-date: burn-block-height
      })
    (map-set plots
      { plot-id: plot-id }
      (merge plot { occupied: true }))
    (var-set next-burial-id (+ burial-id u1))
    (var-set total-burials (+ (var-get total-burials) u1))
    (ok burial-id))
)

(define-public (add-family-connection
    (burial-id uint)
    (relative-burial-id uint)
    (relationship-type (string-ascii 50))
    (notes (string-utf8 200))
  )
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set family-connections
      { burial-id: burial-id, relative-burial-id: relative-burial-id }
      {
        relationship-type: relationship-type,
        notes: notes
      })
    (ok true))
)

(define-public (update-genealogy-index
    (surname (string-ascii 50))
    (burial-count uint)
  )
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set genealogy-index
      { surname: surname }
      {
        burial-count: burial-count,
        first-recorded: burn-block-height,
        last-recorded: burn-block-height
      })
    (ok true))
)

(define-public (transfer-plot-ownership
    (plot-id uint)
    (transfer-id uint)
    (from-owner (optional principal))
    (to-owner principal)
    (transfer-price uint)
  )
  (let ((plot (unwrap! (map-get? plots { plot-id: plot-id }) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set plot-transfers
      { plot-id: plot-id, transfer-id: transfer-id }
      {
        from-owner: from-owner,
        to-owner: to-owner,
        transfer-date: burn-block-height,
        transfer-price: transfer-price
      })
    (map-set plots
      { plot-id: plot-id }
      (merge plot { owner: (some to-owner) }))
    (ok true))
)

(define-public (update-memorial-inscription
    (burial-id uint)
    (new-inscription (string-utf8 500))
  )
  (let ((record (unwrap! (map-get? burial-records { burial-id: burial-id }) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set burial-records
      { burial-id: burial-id }
      (merge record { memorial-inscription: new-inscription }))
    (ok true))
)
