Gem::Specification.new do |s|
  s.name    = 'cryptosystem'
  s.version = '0.0.0'
  s.files   = `git ls-files`.split($/)
  s.summary = 'Simple asymmetric (public-key) encryption.'
  s.author  = 'Josh Wetzel'
  s.license = 'MIT'
  s.required_ruby_version = '~> 2'
end
