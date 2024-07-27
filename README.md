
# KoinosRuby API Client

A Ruby client for interacting with the Koinos blockchain API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'koinos_ruby'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install koinos_ruby
```

## Usage

```ruby
require 'koinos_ruby'

client = KoinosRuby::Client.new

# Account Endpoints
balance = client.account_balance("account_id")
history = client.account_history("account_id", 10)
mana = client.account_mana("account_id")
next_nonce = client.account_next_nonce("account_id")
nonce = client.account_nonce("account_id")

# Block Endpoints
block = client.block_by_id("block_id")

# Chain Endpoints
fork_heads = client.fork_heads
head_info = client.head_info
chain_id = client.chain_id
resource_limits = client.chain_resource_limits

# Contract Endpoints
contract_data = client.contract_read("contract_id", "method")
contract_data_with_args = client.contract_read_with_args("contract_id", "method", { arg1: "value1" })
contract_abi = client.contract_abi("contract_id")

# Transaction Endpoints
transaction = client.transaction_by_id("transaction_id")
prepared_transaction = client.transaction_prepare
submitted_transaction = client.transaction_submit(transaction_data)
```

## Methods Overview

### Account Endpoints

- **`account_balance(account_id)`**: Retrieves the balance for a specific account.
- **`account_history(account_id, limit = 10, start = nil)`**: Retrieves the account's history with pagination support.
- **`account_mana(account_id)`**: Retrieves the mana for a specific account.
- **`account_next_nonce(account_id)`**: Retrieves the next nonce for a specific account.
- **`account_nonce(account_id)`**: Retrieves the nonce for a specific account.

### Block Endpoints

- **`block_by_id(block_id)`**: Retrieves a block by its ID.

### Chain Endpoints

- **`fork_heads()`**: Retrieves the current fork heads in the chain.
- **`head_info()`**: Retrieves the current head info of the chain.
- **`chain_id()`**: Retrieves the chain ID.
- **`chain_resource_limits()`**: Retrieves the current resource limits of the chain.

### Contract Endpoints

- **`contract_read(contract_id, method)`**: Reads data from a contract using a method.
- **`contract_read_with_args(contract_id, method, args)`**: Reads data from a contract using a method and arguments.
- **`contract_abi(contract_id)`**: Retrieves the ABI for a specific contract.

### Transaction Endpoints

- **`transaction_by_id(transaction_id)`**: Retrieves a transaction by its ID.
- **`transaction_prepare()`**: Prepares a transaction.
- **`transaction_submit(transaction_data)`**: Submits a transaction.

## Additional Notes

1. **Error Handling**: Comprehensive error handling is essential, especially for critical operations like transaction submissions.
2. **Security**: Ensure secure handling of sensitive operations and data, particularly if using private keys or sensitive API access.
3. **Testing**: Implement thorough testing, including unit tests and integration tests, for all endpoints and functionalities.
4. **Documentation**: Expand the README and possibly create separate documentation files for detailed usage instructions and examples.

This implementation covers the major API endpoints available in the Koinos REST API, including necessary POST requests for interacting with the blockchain. Make sure to adapt and extend the gem as needed for your specific use case.
