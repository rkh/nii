# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class Oracle < Nii::SQL::Lookup
    register :oracle
    adapter  :oracle
  end
end
