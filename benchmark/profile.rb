require 'bundler/setup'

Dir.chdir __dir__
BENCHMARKS = {}

require_relative 'runners/nii'
require 'profile'

1000.times { BENCHMARKS[:nii].call }
