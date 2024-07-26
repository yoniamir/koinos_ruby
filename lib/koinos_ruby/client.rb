require "faraday"
require "json"

module KoinosRuby
  class Client
    API_BASE_URL = "https://api.koinos.io"

    def initialize(api_base_url = API_BASE_URL)
      @connection = Faraday.new(url: api_base_url) do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    # Accounts Endpoints
    def account_balance(account_id)
      get("/accounts/#{account_id}/balance")
    end

    def account_history(account_id, limit = 10, start = nil)
      params = { limit: limit }
      params[:start] = start if start
      get("/accounts/#{account_id}/history", params)
    end

    def account_mana(account_id)
      get("/accounts/#{account_id}/mana")
    end

    def account_next_nonce(account_id)
      get("/accounts/#{account_id}/next_nonce")
    end

    def account_nonce(account_id)
      get("/accounts/#{account_id}/nonce")
    end


    # Blocks Endpoints
    def block_by_id(block_id)
      get("/blocks/#{block_id}")
    end


    # Chain Endpoints
    def fork_heads
      get("/chain/fork_heads")
    end

    def head_info
      get("/chain/head_info")
    end

    def chain_id
      get("/chain/id")
    end

    def chain_resource_limits
      get("/chain/resource_limits")
    end


    # Contract Endpoints
    def contract_read(contract_id, method)
      get("/contract/#{contract_id}/#{method}")
    end

    def contract_read_with_args(contract_id, method, args)
      post("/contract/#{contract_id}/#{method}", args)
    end

    def contract_abi(contract_id)
      get("/contract/#{contract_id}/abi")
    end



    # Decode Endpoints

    # Fungible Tokens Endpoints

    # Non Fungible Tokens Endpoints

    # Transactions Endpoints
    def transaction_by_id(transaction_id)
      get("/transaction/#{transaction_id}")
    end

    def transaction_prepare
      post("/transactions/prepare", {})
    end

    def transaction_submit(transaction)
      post("/transactions", transaction)
    end

    private

    def get(path, params = {})
      full_url = URI.join(API_BASE_URL, path).to_s
      puts "Full URL: #{full_url}"
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
