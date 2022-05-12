require File.expand_path('../lib/cryptosystem/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'cryptosystem'
  spec.version = Cryptosystem::VERSION
  spec.summary = 'Simple encryption and decryption with asymmetric (or public-key) cryptography.'
  spec.author = 'Josh Wetzel'
  spec.license = 'MIT'

  spec.files = Dir['lib/**/*.rb']
  spec.required_ruby_version = '>= 2'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
end
