module Nano
  module Util
    ALLOWED_CHARS = '13456789abcdefghijkmnopqrstuwxyz'.freeze

    def self.hex_to_bin(hex)
      hex.scan(/../).map { |x| x.hex }.pack('C*')
    end

    def self.bin_to_hex(bin)
      bin.unpack('H*').first
    end

    def self.public_key_to_address(prefix, public_key)
      key_bytes = public_key.unpack('C*')
      account = self.encode(key_bytes)
      checksum_bytes = Blake2b.bytes(public_key, Blake2b::Key.none, 5).reverse
      checksum = self.encode(checksum_bytes)

      "#{prefix}_#{account}#{checksum}"
    end

    def self.encode(bytes)
      length = bytes.length
      leftover = (length * 8) % 5
      offset = leftover == 0 ? 0 : 5 - leftover

      value = 0
      output = ""
      bits = 0

      length.times do |i|
        value = (value << 8) | bytes[i]
        bits += 8

        while (bits >= 5)
          output += ALLOWED_CHARS[(value >> (bits + offset - 5)) & 31]
          bits -= 5
        end
      end

      if bits > 0
        output += ALLOWED_CHARS[(value << (5 - (bits + offset))) & 31]
      end

      output
    end
  end
end
