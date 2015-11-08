Pod::Spec.new do |s|
  s.name             = "HasAssociatedObjects"
  s.version          = "0.1.0"
  s.summary          = "We can add some stored objects to Swift extension"

  s.homepage         = "https://github.com/tokorom/HasAssociatedObjects"
  s.license          = 'MIT'
  s.author           = { "tokorom" => "tokorom@gmail.com" }
  s.source           = { :git => "https://github.com/tokorom/HasAssociatedObjects.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'HasAssociatedObjects/**/*.swift'
end
