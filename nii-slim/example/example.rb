require 'bundler/setup'
require 'nii/slim'

require 'active_support/all'
Slim::Engine.set_options pretty: true

messages = Nii["#{__dir__}/locales"]
template = Slim::Template.new "#{__dir__}/example.slim"
context  = Nii::Context.new(:en, messages)

puts template.render(nil, nii: context, name: "User A", users: ["User C", "User D"])
