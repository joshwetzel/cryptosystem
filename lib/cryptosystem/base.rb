module Cryptosystem
  class Base
    class << self
      def configure
        yield self
      end
    end

    def expand_path(path)
      File.expand_path(path)
    end

    def read_file(path)
      File.read(path)
    end

    def base64_encode(value)
      Base64.strict_encode64(value)
    end

    def base64_decode(value)
      Base64.strict_decode64(value)
    end
  end
end
