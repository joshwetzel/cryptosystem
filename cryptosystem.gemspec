# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptosystem/version'

Gem::Specification.new do |s|
  s.name    = 'cryptosystem'
  s.version = Cryptosystem::VERSION
  s.files   = `git ls-files`.split($/)
  s.summary = 'Asymmetric encryption'
  s.author  = 'Josh Wetzel'
  s.license = 'MIT'
  s.required_ruby_version = '~> 2'
end
