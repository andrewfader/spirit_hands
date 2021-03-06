# -*- encoding: utf-8 -*-

$:.unshift File.expand_path('../lib', __FILE__)
module ::SpiritHands
  autoload :VERSION, 'spirit_hands/version'
end

Gem::Specification.new do |gem|
  gem.name          = 'spirit_hands'
  gem.version       = SpiritHands::VERSION
  gem.author        = 'Barry Allard'
  gem.email         = 'barry.allard@gmail.com'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/steakknife/spirit_hands'
  gem.summary       = 'Exercise those fingers. Pry-based enhancements for the default Rails console.'
  gem.description   = "Spending hours in the rails console? Spruce it up and show off those hard-working hands! spirit_hands replaces IRB with Pry, improves output through awesome_print, and has some other goodies up its sleeves."

  gem.executables   = `git ls-files -z -- bin/*`.split("\0")
    .select { |f| File.executable?(f) }
    .map{ |f| File.basename(f) }
  gem.files         = `git ls-files -z`.split("\0")
  gem.test_files    = `git ls-files -z -- {test,spec,features}/*`.split("\0")

  # Dependencies
  gem.required_ruby_version = '>= 2.0'
  gem.add_runtime_dependency 'pry'
  gem.add_runtime_dependency 'pry-rails'
  gem.add_runtime_dependency 'pry-doc'
  if RUBY_PLATFORM == 'java'
    gem.platform = 'java'
    gem.add_runtime_dependency 'pry-nav'
  else
    gem.add_runtime_dependency 'pry-byebug'
  end
  gem.add_runtime_dependency 'hirb'
  gem.add_runtime_dependency 'hirb-unicode-steakknife'
  gem.add_runtime_dependency 'pry-coolline'
  gem.add_runtime_dependency 'awesome_print'
end
.tap {|gem| pk = File.expand_path(File.join('~/.keys', 'gem-private_key.pem')); gem.signing_key = pk if File.exist? pk; gem.cert_chain = ['gem-public_cert.pem']} # pressed firmly by waxseal
