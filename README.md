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
require 'koinos_api_client'

client = KoinosApiClient::Client.new

# Block Endpoints
block = client.get_block_by_id("block_id")
blocks = client.get_blocks_by_height(100, 110)
blocks_by_producer = client.get_blocks_by_producer("producer_id")

# Transaction Endpoints
transaction = client.get_transaction_by_id("transaction_id")
transactions = client.get_transactions_by_block("block_id")
transactions_by_account = client.get_transactions_by_account("account_id")

# Account Endpoints
balance = client.get_account_balance("account_id")
nonce = client.get_account_nonce("account_id")
resources = client.get_account_resources("account_id")
history = client.get_account_history("account_id")

# Event Endpoints
event = client.get_event_by_id("event_id")
events_by_block = client.get_events_by_block("block_id")
events_by_transaction = client.get_events_by_transaction("transaction_id")
events_by_account = client.get_events_by_account("account_id")

# Token Endpoints
token_info = client.get_token_info("token_id")
token_balance = client.get_token_balance("account_id", "token_id")
token_transfers = client.get_token_transfers("account_id", "token_id")

# Governance Endpoints
governance_parameters = client.get_governance_parameters
proposals = client.get_governance_proposals("active")
votes = client.get_governance_votes("proposal_id")

# Utility Endpoints
status = client.get_status
chain_id = client.get_chain_id

# Mana Endpoints
account_mana = client.get_account_mana("account_id")
system_mana = client.get_system_mana

# Contract Endpoints
contract_metadata = client.get_contract_metadata("contract_id")
contract_state = client.get_contract_state("contract_id", "key")

# POST Endpoints
client.submit_transaction(transaction)
client.submit_contract_call(contract_call)
client.submit_proposal(proposal)
client.submit_vote(vote)
```

### Additional Notes
1. **Error Handling**: Add comprehensive error handling, especially for critical operations like transaction submissions.
2. **Security**: Ensure secure handling of sensitive operations and data, particularly if using private keys or sensitive API access.
3. **Testing**: Implement thorough testing, including unit tests and integration tests, for all endpoints and functionalities.
4. **Documentation**: Expand the README and possibly create separate documentation files for detailed usage instructions and examples. 

This implementation covers all API endpoints mentioned in the Koinos REST API documentation, including the POST requests necessary for interacting with the blockchain. Make sure to adapt and extend the gem as needed for your specific use case.
