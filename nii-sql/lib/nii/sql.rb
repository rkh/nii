# frozen_string_literal: true
require 'nii/core'
require 'sequel'

module Nii::SQL
  autoload :Connection, 'nii/sql/connection'
  autoload :Lookup,     'nii/sql/lookup'
  autoload :Schema,     'nii/sql/schema'
  autoload :QueryCache, 'nii/sql/query_cache'
end
