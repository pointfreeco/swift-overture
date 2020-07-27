Pod::Spec.new do |s|
  s.name = "Overture"
  s.version = "0.5.0"
  s.summary = "A library for function composition."

  s.description = <<-DESC
  A library for function composition.

  Overture is a collection of functions for building programs with functions.
  DESC

  s.homepage = "https://github.com/pointfreeco/swift-overture"

  s.license = "MIT"

  s.authors = {
    "Stephen Celis" => "stephen@stephencelis.com",
    "Brandon Williams" => "mbw234@gmail.com"
  }
  s.social_media_url = "https://twitter.com/pointfreeco"

  s.source = {
    :git => "https://github.com/pointfreeco/swift-overture.git",
    :tag => s.version
  }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
  s.swift_version = '5.0', '5.1', '5.2', '5.3'

  s.source_files  = "Sources", "Sources/**/*.swift"
end
