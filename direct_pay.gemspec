$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "direct_pay/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "direct_pay"
  s.version     = DirectPay::VERSION
  s.authors     = ["ustb"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DirectPay."
  s.description = "TODO: Description of DirectPay."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
