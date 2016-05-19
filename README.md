[![Gem Version](https://badge.fury.io/rb/cryptosystem.svg)](https://badge.fury.io/rb/cryptosystem)
[![Build Status](https://travis-ci.org/jdubswe/cryptosystem.svg?branch=master)](https://travis-ci.org/jdubswe/cryptosystem)

# Cryptosystem
Cryptosystem is a Ruby library facilitating simple encryption and decryption with asymmetric cryptography (or public-key
cryptography). At this time, only RSA is supported.

## Installation
In your Gemfile, include the `cryptosystem` gem and then `bundle install`.

```ruby
gem 'cryptosystem'
```

## Getting Started
In order to encrypt and decrypt, a public and private key must be generated.

```bash
$ openssl genrsa -out private.key
$ openssl rsa -in private.key -pubout > public.pub
```

## Configuration
Cryptosystem must know the path and password to your private key as well as the path to your public key.

```ruby
# config/initializers/cryptosystem.rb

Cryptosystem::RSA.configure do |config|
  config.password = ENV['secret-password']
  config.private_key_path = 'path/to/private.key'
  config.public_key_path = 'path/to/public.pub'
end
```

Configuration options may also be passed in or overridden when instantiating a new object.

```ruby
config = {
  password: ENV['secret-password'],
  private_key_path: 'path/to/private.key',
  public_key_path: 'path/to/public.pub'
}

rsa = Cryptosystem::RSA.new(config)
```

## Encrypting
After generating a key pair and properly configuring Cryptosystem, encryption is straightforward.

```ruby
rsa = Cryptosystem::RSA.new
rsa.encrypt('secret') # => "JxpuhTpEqRtMLmaSfaq/X6XONkBnMe..."
```

The encrypted value is Base64 encoded, making it suitable for database storage.

## Decrypting
Decrypting is as simple as passing in an encrypted, Base64 encoded value.

```ruby
rsa = Cryptosystem::RSA.new
encrypted_value = rsa.encrypt('secret') # => "Y8DWJc2/+7TIxdLEolV99XI2sclHuK..."
rsa.decrypt(encrypted_value) # => "secret"
```

## Acknowledgments
Special thanks to [@jedspurg](https://github.com/jedspurg) for the inspiration for this project.
