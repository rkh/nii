# frozen_string_literal: true

Nii::SQL::Schema.define :default do
  table :nii_translations, :translations, :localizations, create: :translations, id: { uuid: true }, timestamps: true do
    content :nii_content, :content, :target, :template, :translation, :msgstr, :text, :payload, :value, create: :content do |locale|
      locale.to_s
    end

    description :nii_description, :description, :comment, :note,           create: :description
    format      :nii_format, :format,                                      create: :format
    locale      :nii_locale, :locale, :lang, :language,                    create: :locale
    name        :nii_name, :name, :key, :source, :message_id, :msgid, :id, create: false
    namespace   :nii_namespace, :namespace, :ns,                           create: :namespace
  end
end
