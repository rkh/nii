# frozen_string_literal: true
require 'nii'
context          = Nii::Context.new('en', lookup: Nii::Lookup.new('fluent'), escape_html: false, namespace: 'example')
context[:name]   = 'World'
BENCHMARKS[:nii] = -> { context.render('hello') }
