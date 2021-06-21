# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  self[:sql] = Nii::SQL::Lookup
end
