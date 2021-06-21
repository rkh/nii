# frozen_string_literal: true

Nii::SQL::Schema.define :fast_gettext do
  table :translation_texts, timestamps: true do
    content :text
    locale  :locale
    format  'fast_gettext_db'
  end

  table :translation_keys, timestamps: true do
    name  :key, create: { unique: true, null: false }
    joins :translation_texts, :translation_key_id
  end
end
