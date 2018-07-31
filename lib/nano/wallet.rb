require_relative "wallet/version"
require_relative "wallet/account"

module Nano
  class Wallet
    def self.with_random_seed
      self.new(SecureRandom.hex(32))
    end

    attr_reader :accounts

    def initialize(seed)
      @seed = seed
      @accounts = []
    end

    def account_at_index(index)
      Nano::Account.new(@seed, index)
    end

    def add_accounts!(count)
      count.times { generate_account! }
    end

    def add_account!
      account = Nano::Account.new(@seed, @accounts.size)
      @accounts << account
      account
    end
  end
end
