# frozen_string_literal: true

Nii::SQL::Schema.define :pontoon do
  table :base_translation, created_at: :date do
    content :string
  end

  table :base_locale do
    locale :code
    joins  :base_translation, :locale_id
  end

  table :base_entity, created_at: :date_created do
    name        :key
    description :comment
    joins       :base_translation, :entity_id
  end

  table :base_resource, created_at: :date_created do
    namespace :path
    format    :format
    joins     :base_entity, :resource_id
  end
end
