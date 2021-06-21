# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class SQLite < Nii::SQL::Lookup
    register :sqlite, :sqlite3
    adapter  :sqlite
  end
end
