module Cryptosystem
  class RSA < Base
    class << self
      attr_accessor :password
      attr_accessor :private_key_path
      attr_accessor :public_key_path
    end

    attr_reader :password
    attr_reader :private_key_path
    attr_reader :public_key_path

    def initialize(config = {})
      @password = config[:password] || Cryptosystem::RSA.password
      @private_key_path = expand_path(config[:private_key_path] || Cryptosystem::RSA.private_key_path)
      @public_key_path = expand_path(config[:public_key_path] || Cryptosystem::RSA.public_key_path)
    rescue => error
      raise ConfigurationError, error.message
    end

    def encrypt(value)
      return nil if value.nil?
      base64_encode(public_key.public_encrypt(value))
    rescue => error
      raise EncryptError, error.message
    end

    def decrypt(value)
      return nil if value.nil?
      private_key.private_decrypt(base64_decode(value))
    rescue => error
      raise DecryptError, error.message
    end

    private

    def private_key
      @private_key ||= rsa.new(read_file(private_key_path), password)
    end

    def public_key
      @public_key ||= rsa.new(read_file(public_key_path))
    end

    def rsa
      OpenSSL::PKey::RSA
    end
  end
end
