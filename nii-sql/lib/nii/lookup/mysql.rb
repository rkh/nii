# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class MySQL < Nii::SQL::Lookup
    register :mysql
    adapter  :mysql
  end
end
