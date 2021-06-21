# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class MySQL2 < Nii::SQL::Lookup
    register :mysql2
    adapter  :mysql2
  end
end
