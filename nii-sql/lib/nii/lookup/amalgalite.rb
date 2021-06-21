# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class Amalgalite < Nii::SQL::Lookup
    register :amalgalite
    adapter  :amalgalite
  end
end
