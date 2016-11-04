require 'albacore'
build :msbuild do |b|
  b.properties = { :configuration => :Debug }
  b.target = [ 'Clean', 'Build' ]
  b.file = "AdventureWorks.sln"
  b.logging = 'detailed'
end
