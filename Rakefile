require 'albacore'

Albacore.configure do |config|
  config.mstest.command = "C:/Program\ Files\ (x86)/Microsoft Visual Studio 10.0/Common7/IDE/mstest.exe"
  config.msbuild.targets = [ :Clean, :Build ]
end

task :default => [:msbuild]

build :msbuild do |b|
  b.properties = { :configuration => :Debug }
  b.targets = [ :Build ]
  b.solution = "AdventureWorks.sln"
end
