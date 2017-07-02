Pod::Spec.new do |s|
  s.name             = "HasAssociatedObjects"
  s.version          = "1.0.1"
  s.summary          = "We can add some stored objects to Swift extension"

  s.homepage         = "https://github.com/tokorom/HasAssociatedObjects"
  s.license          = 'MIT'
  s.author           = { "tokorom" => "tokorom@gmail.com" }
  s.source           = { :git => "https://github.com/tokorom/HasAssociatedObjects.git", :tag => s.version.to_s }

  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"

  s.source_files = 'HasAssociatedObjects/**/*.swift'
end
