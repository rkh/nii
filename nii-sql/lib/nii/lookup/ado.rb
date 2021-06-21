# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class ADO < Nii::SQL::Lookup
    register :ado
    adapter  :ado
  end
end
