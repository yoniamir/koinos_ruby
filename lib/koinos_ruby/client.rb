require 'pry'
require "faraday"
require "json"

module KoinosRuby
  class Client
    API_BASE_URL = "https://api.koinos.io"

    def initialize(api_key, api_base_url = API_BASE_URL)
      @api_key = api_key
      @connection = Faraday.new(url: api_base_url) do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
        conn.headers['X-API-KEY'] = api_key
      end
    end

    # Block Endpoints
    def get_block_by_id(block_id)
      get("blocks/#{block_id}")
    end

    def get_blocks_by_height(start_height, end_height)
      get("blocks", { start_height: start_height, end_height: end_height })
    end

    def get_blocks_by_producer(producer_id)
      get("blocks", { producer: producer_id })
    end

    # Transaction Endpoints
    def get_transaction_by_id(transaction_id)
      get("transactions/#{transaction_id}")
    end

    def get_transactions_by_block(block_id)
      get("blocks/#{block_id}/transactions")
    end

    def get_transactions_by_account(account_id)
      get("transactions", { account: account_id })
    end

    # Account Endpoints
    def get_account_balance(account_id)
      get("accounts/#{account_id}/balance")
    end

    def get_account_nonce(account_id)
      get("accounts/#{account_id}/nonce")
    end

    def get_account_resources(account_id)
      get("accounts/#{account_id}/resources")
    end

    def get_account_history(account_id, limit = 10, start = nil)
      params = { limit: limit }
      params[:start] = start if start
      get("accounts/#{account_id}/history", params)
    end

    # Event Endpoints
    def get_event_by_id(event_id)
      get("events/#{event_id}")
    end

    def get_events_by_block(block_id)
      get("blocks/#{block_id}/events")
    end

    def get_events_by_transaction(transaction_id)
      get("transactions/#{transaction_id}/events")
    end

    def get_events_by_account(account_id)
      get("accounts/#{account_id}/events")
    end

    # Token Endpoints
    def get_token_info(token_id)
      get("tokens/#{token_id}")
    end

    def get_token_balance(account_id, token_id)
      get("tokens/#{token_id}/balances/#{account_id}")
    end

    def get_token_transfers(account_id, token_id, limit = 10, start = nil)
      params = { limit: limit }
      params[:start] = start if start
      get("tokens/#{token_id}/transfers/#{account_id}", params)
    end

    # Governance Endpoints
    def get_governance_parameters
      get("governance/parameters")
    end

    def get_governance_proposals(status = nil)
      params = {}
      params[:status] = status if status
      get("governance/proposals", params)
    end

    def get_governance_votes(proposal_id)
      get("governance/proposals/#{proposal_id}/votes")
    end

    # Utility Endpoints
    def get_status
      get("status")
    end

    def get_chain_id
      get("chain_id")
    end

    # Mana Endpoints
    def get_account_mana(account_id)
      get("accounts/#{account_id}/mana")
    end

    def get_system_mana
      get("system/mana")
    end

    # Contract Endpoints
    def get_contract_metadata(contract_id)
      get("contracts/#{contract_id}/metadata")
    end

    def get_contract_state(contract_id, key)
      get("contracts/#{contract_id}/state/#{key}")
    end

    # POST Endpoints
    def submit_transaction(transaction)
      post("transactions", transaction)
    end

    def submit_contract_call(contract_call)
      post("contracts/call", contract_call)
    end

    def submit_proposal(proposal)
      post("governance/proposals", proposal)
    end

    def submit_vote(vote)
      post("governance/votes", vote)
    end

    private

    def get(path, params = {})
      response = @connection.get(path, params)
      handle_response(response)
    end

    def post(path, body)
      response = @connection.post(path, body.to_json)
      handle_response(response)
    end

    def handle_response(response)
      if response.success?
        response.body
      else
        raise Error, "API request failed: #{response.status} #{response.body}"
      end
    end
  end
end
