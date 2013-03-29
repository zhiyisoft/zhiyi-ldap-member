# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zhiyi-member/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["SuYu"]
  gem.email         = ["suyu@zhiyisoft.com"]
  gem.description   = "user manager"
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zhiyi-member"
  gem.require_paths = ["lib"]
  gem.version       = Zhiyi::Member::VERSION

  %w(ruby-ldap).each {|p| gem.add_dependency p}
  %w(rspec).each {|p| gem.add_development_dependency p}
end
