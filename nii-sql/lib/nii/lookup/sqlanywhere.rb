# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class SQLAnywhere < Nii::SQL::Lookup
    register :sqlanywhere, :sql_anywhere
    adapter  :sqlanywhere
  end
end
