# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class TinyTds < Nii::SQL::Lookup
    register :tinytds, :tiny_tds, :sqlserver, :sql_server
    adapter  :tinytds
  end
end
