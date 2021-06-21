# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class ActiveRecord < Nii::SQL::Lookup
    register :active_record, :activerecord
    config[:connection] = :active_record
  end
end
