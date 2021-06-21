# frozen_string_literal: true
require 'nii/sql'

module Nii::Lookup
  class DB2 < Nii::SQL::Lookup
    register :db2, :ibmdb, :ibm_db
    adapter  :ibmdb
  end
end
