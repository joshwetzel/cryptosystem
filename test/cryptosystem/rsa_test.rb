require 'test_helper'

class RSATest < Minitest::Test
  def setup
    @rsa = Cryptosystem::RSA.new
  end

  def test_initialize
    config = {
      password: 'override',
      private_key_path: 'override.key',
      public_key_path: 'override.pub'
    }

    rsa = Cryptosystem::RSA.new(config)
    assert_equal config[:password], rsa.password
    assert_equal File.expand_path(config[:private_key_path]), rsa.private_key_path
    assert_equal File.expand_path(config[:public_key_path]), rsa.public_key_path

    assert_equal Cryptosystem::RSA.password, @rsa.password
    assert_equal File.expand_path(@rsa.private_key_path), @rsa.private_key_path
    assert_equal File.expand_path(@rsa.public_key_path), @rsa.public_key_path
  end

  def test_value_is_encrypted
    encrypted_value = @rsa.encrypt('test')
    refute_equal 'test', encrypted_value
  end

  def test_value_is_decrypted
    encrypted_value = @rsa.encrypt('test')
    assert_equal 'test', @rsa.decrypt(encrypted_value)
  end

  def test_encrypted_value_is_base64_encoded
    assert Base64.strict_decode64(@rsa.encrypt('test'))
  end

  def test_decrypted_value_is_base64_decoded
    assert Base64.strict_encode64(@rsa.decrypt(@rsa.encrypt('test')))
  end

  def test_encrypting_nil_value_returns_nil
    assert_nil @rsa.encrypt(nil)
  end

  def test_decrypting_nil_value_returns_nil
    assert_nil @rsa.decrypt(nil)
  end
end
