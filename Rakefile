#!/usr/bin/env ruby
require 'albacore'

task :default => [:build]

msbuild :build do |b|
    b.properties = { :configuration => :Debug }
    b.targets = [ :Build ]
    b.solution = "AdventureWorks.sln"
end
