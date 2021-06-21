# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class Postgres < Nii::SQL::Lookup
    register :postgres, :postgresql, :pg
    adapter  :postgres
  end
end
