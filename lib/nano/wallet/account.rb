require "blake2b"
require "ed25519_blake2b"

require_relative "util"

module Nano
  class Account
    def initialize(seed, index = 0)
      @seed = seed
      @seed_bin = Util.hex_to_bin(@seed)
      @index = index
    end

    def private_key
      Util.hex_to_bin(Blake2b.hex(@seed_bin + [@index].pack('L'), Blake2b::Key.none, 32))
    end

    def public_key
      Ed25519Blake2b.public_key(private_key)
    end

    def address

    end
    alias_method :to_s, :address
  end
end
