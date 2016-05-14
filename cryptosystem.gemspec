# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptosystem/version'

Gem::Specification.new do |s|
  s.name    = 'cryptosystem'
  s.version = Cryptosystem::VERSION
  s.files   = `git ls-files`.split($/)
  s.summary = 'Simple asymmetric (public-key) encryption.'
  s.description = <<-DESC
    Cryptosystem is a Ruby library facilitating simple encryption and
    decryption with asymmetric cryptography (or public-key cryptography).
  DESC
  s.author  = 'Josh Wetzel'
  s.license = 'MIT'
  s.required_ruby_version = '~> 2'
end
