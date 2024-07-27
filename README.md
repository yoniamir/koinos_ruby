# Koinos API Client

A Ruby client for interacting with the Koinos blockchain API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'koinos_api_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install koinos_api_client

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

### Additional Notes
Error Handling: Comprehensive error handling is essential, especially for critical operations like transaction submissions.
Security: Ensure secure handling of sensitive operations and data, particularly if using private keys or sensitive API access.
Testing: Implement thorough testing, including unit tests and integration tests, for all endpoints and functionalities.
Documentation: Expand the README and possibly create separate documentation files for detailed usage instructions and examples.

This implementation covers the major API endpoints available in the Koinos REST API, including necessary POST requests for interacting with the blockchain. Make sure to adapt and extend the gem as needed for your specific use case.
