
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nano/wallet/version"

Gem::Specification.new do |spec|
  spec.name          = "nano-wallet"
  spec.version       = Nano::Wallet::VERSION
  spec.authors       = ["Ryan LeFevre"]
  spec.email         = ["meltingice8917@gmail.com"]

  spec.summary       = %q{A library for generating account data for the Nano cryptocurrency.}
  spec.description   = %q{A library for generating account private/public keys and addresses for the Nano cryptocurrency.}
  spec.homepage      = "https://github.com/kitepay/nano-wallet"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "blake2b"
  spec.add_dependency "ed25519_blake2b"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
