version = "0.3.0"

Pod::Spec.new do |s|
  s.name = "Overture"
  s.version = version
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
    :tag => version
  }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"

  s.source_files  = "Sources", "Sources/**/*.swift"
end
