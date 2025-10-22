# Cemetery Records

A blockchain-based cemetery record management system for cemetery operators to digitize burial records, plot ownership, and genealogical information with searchable access for families and researchers.

## Overview

Cemeteries maintain critical historical records for genealogy research and plot management. This system digitizes burial records, providing searchable genealogical access, plot ownership tracking, and memorial information management.

## Features

- **Burial Record Management**: Digitize and maintain comprehensive burial records
- **Plot Ownership Tracking**: Track cemetery plots and ownership transfers
- **Genealogical Search**: Searchable database for family history research
- **Memorial Information**: Store memorial inscriptions and biographical details
- **Interment History**: Complete history of all burials in cemetery
- **Plot Availability**: Real-time plot availability tracking

## Smart Contracts

### burial-recorder
Manages cemetery records with genealogical search capabilities and plot ownership tracking.

## Getting Started

```bash
git clone <repository-url>
# Cemetery Records System

A blockchain-based cemetery record management system for cemetery operators to manage burial records, plot ownership, and genealogical information access.

## Overview

Cemetery Records System digitizes and secures cemetery management operations using blockchain technology. This system enables cemeteries to maintain accurate burial records, track plot ownership, and provide searchable genealogical access for families and researchers.

## Real-Life Use Case

Cemeteries maintain extensive burial records for genealogy research purposes. This system digitizes these records and provides a secure, searchable platform for genealogical access, making it easier for families to trace their ancestry and for cemetery operators to manage their records efficiently.

## Features

### Burial Record Management
- Register new burial records with comprehensive details
- Track deceased information, burial dates, and plot locations
- Maintain next-of-kin contact information
- Record memorial inscriptions and special notes

### Plot Ownership Tracking
- Assign and transfer plot ownership
- Track plot availability and occupancy status
- Manage perpetual care agreements
- Record plot purchase and transfer history

### Genealogical Search
- Search records by name, date, or plot location
- Access family lineage information
- View memorial and inscription details
- Generate genealogical reports

### Cemetery Administration
- Manage multiple cemetery sections and plots
- Track maintenance schedules
- Record plot prices and payment status
- Generate administrative reports

## Smart Contract: burial-recorder

The `burial-recorder` contract manages all cemetery record operations with the following capabilities:

- **Record Creation**: Cemetery operators can create detailed burial records
- **Ownership Management**: Track and transfer plot ownership securely
- **Search Functionality**: Enable efficient genealogical searches
- **Access Control**: Ensure only authorized operators can modify records
- **Data Integrity**: Maintain immutable historical records on the blockchain

## Technical Stack

- **Blockchain**: Stacks blockchain
- **Smart Contract Language**: Clarity
- **Development Framework**: Clarinet
- **Storage**: On-chain data storage for critical records

## Getting Started

### Prerequisites
- Clarinet CLI installed
- Node.js and npm
- Git

### Installation

```bash
# Clone the repository
git clone https://github.com/oluwamiposi/cemetery-records.git

# Navigate to project directory
cd cemetery-records

# Install dependencies
npm install
```

### Testing

```bash
# Check contract syntax
clarinet check

# Run tests
clarinet test
```

## Contract Functions

### Public Functions
- `register-burial`: Register a new burial record
- `update-burial-record`: Update existing burial information
- `transfer-plot-ownership`: Transfer plot ownership to a new owner
- `mark-plot-occupied`: Mark a plot as occupied
- `mark-plot-available`: Mark a plot as available

### Read-Only Functions
- `get-burial-record`: Retrieve burial record details
- `get-plot-info`: Get plot ownership and status
- `search-by-name`: Search records by deceased name
- `search-by-plot`: Search records by plot location
- `get-cemetery-stats`: Get overall cemetery statistics

## Security

- Only authorized cemetery operators can modify records
- Immutable historical records prevent data tampering
- Owner-only functions for administrative operations
- Secure plot ownership transfers with verification

## Contributing

Contributions are welcome! Please feel free to submit pull requests.

## License

MIT License

## Contact

For questions or support, please open an issue in the repository.

## Acknowledgments

Built with Clarity on the Stacks blockchain, providing secure and transparent cemetery record management for genealogical research and cemetery operations.
npm install
clarinet check
clarinet test
```

## License

MIT License