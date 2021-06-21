# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class Sequel < Nii::SQL::Lookup
    register :sequel
    config[:connection] = :sequel
  end
end
