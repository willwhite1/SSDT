require 'albacore'

build :msbuild do |b|
  b.properties = { :configuration => :Debug }
  b.targets = [ :Build ]
  b.solution = "AdventureWorks.sln"
end
