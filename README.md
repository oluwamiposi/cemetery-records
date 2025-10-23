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
# Cemetery Records

A blockchain-based cemetery record system for cemetery operators to manage burial records, plot ownership, and provide genealogical information access.

## Overview

Cemetery Records is a smart contract system built on the Stacks blockchain using Clarity. It digitizes traditional cemetery record-keeping and provides searchable, verifiable access to burial and genealogical information.

## Real-World Use Case

Cemeteries maintain burial records for genealogy research purposes. This system digitizes those records and provides searchable genealogical access, enabling family historians, genealogists, and descendants to easily locate and verify burial information.

## Features

- **Burial Record Management**: Create and maintain digital records of burials with comprehensive metadata
- **Plot Ownership Tracking**: Track ownership and occupancy status of cemetery plots
- **Genealogical Search**: Search capabilities for family history research
- **Record Verification**: Blockchain-based immutable record storage
- **Access Control**: Authorized cemetery operators can manage records

## Smart Contracts

### burial-recorder

Manages cemetery records with genealogical search capabilities and plot ownership tracking. Key functionality includes:

- Recording new burials with detailed information
- Tracking plot ownership and transfers
- Maintaining genealogical connections
- Providing searchable access to historical records
- Managing cemetery operator permissions

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) installed
- Basic understanding of Clarity smart contracts

### Installation

```bash
# Clone the repository
git clone https://github.com/oluwamiposi/cemetery-records.git

# Navigate to project directory
cd cemetery-records

# Check contract syntax
clarinet check
```

### Testing

```bash
# Run all tests
clarinet test

# Run specific test
clarinet test tests/burial-recorder_test.ts
```

## Project Structure

```
cemetery-records/
├── contracts/
│   └── burial-recorder.clar
├── tests/
│   └── burial-recorder_test.ts
├── settings/
│   ├── Devnet.toml
│   ├── Testnet.toml
│   └── Mainnet.toml
├── Clarinet.toml
└── README.md
```

## Usage

The burial-recorder contract provides functions for:

1. **Recording Burials**: Store burial information including deceased details, plot location, and genealogical data
2. **Managing Plots**: Track plot ownership, availability, and occupancy
3. **Searching Records**: Query burial records for genealogical research
4. **Updating Information**: Authorized operators can update and maintain records

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

MIT License

## Contact

For questions or support, please open an issue in the GitHub repository.
npm install
clarinet check
clarinet test
```

## License

MIT License