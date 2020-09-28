require_relative 'lib/simple/antivirus/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-antivirus"
  spec.version       = Simple::Antivirus::VERSION
  spec.authors       = ["Eugen Müller"]
  spec.email         = ["eugen.mueller@enermarket.de"]

  spec.summary       = %q{This is a simple antivirus validator}
  spec.description   = %q{The simple antivirus validator check files for malware and it is based on the amazing clamby gem}
  spec.homepage      = "https://github.com/eugenmueller/simple-antivirus"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/eugenmueller/simple-antivirus"
  spec.metadata["changelog_uri"] = "https://github.com/eugenmueller/simple-antivirus/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "clamby", "~> 1.6"

  # The activesupport dependency is used for the string manipulations done in
  # the Ratonvirus main module through ActiveSupport::Inflector.
  spec.add_dependency "activesupport", "~> 6.0"


  # Basic development dependencies.
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # Rails integration tests
  spec.add_development_dependency "rspec-rails", "~> 4.0"

  # Code coverage
  spec.add_development_dependency "simplecov", "~> 0.18.0"

  # The following Rails dependencies are needed to test the actual validator to
  # be attached to Active Models. These are not necessary for the basic
  # functionality of this gem and all other parts of the gem should work fine
  # without them. Therefore, only needed as development dependencies.
  spec.add_development_dependency "activemodel", "~> 6.0"
  spec.add_development_dependency "activestorage", "~> 6.0"

  # The following dependency is needed to test the CarrierWave storage. This is
  # not required for running this gem without CarrierWave.
  spec.add_development_dependency "carrierwave", "~> 2.1"
end
