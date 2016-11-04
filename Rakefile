#!/usr/bin/env ruby

require 'albacore'

 msbuild :build do |b|
     b.properties = { :configuration => :Debug }
     b.targets = [ :Build ]
     b.solution = "AdventureWorks.sln"
 end
