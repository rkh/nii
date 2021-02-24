require 'bundler/setup'
require 'nii/rbnf'

path  = File.expand_path 'roman.rbnf', __dir__
roman = Nii::RBNF.load_file path
puts roman.format(Time.now.year)
puts roman.format(1.4)
