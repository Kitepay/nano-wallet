module Nano
  module Util
    def self.hex_to_bin(hex)
      hex.scan(/../).map { |x| x.hex }.pack('C*')
    end

    def self.bin_to_hex(bin)
      bin.unpack('H*').first
    end
  end
end
