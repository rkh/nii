# frozen_string_literal: true

Nii::SQL::Schema.define :i18n do
  table :translations, timestamps: true do
    locale  :locale
    name    :key
    content :value
  end
end
