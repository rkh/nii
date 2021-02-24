# frozen_string_literal: true

module Nii::Formatters::Nii
  module Calendar
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end

  module Date
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end

  module Locale
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end

  module Localized
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end

  module NumberingSystem
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end

  module Territory
    extend self
    # @see Nii::Context#format
    # @option (see Nii::Formatters::String.format_as_territory)
    # @!scope module
    def format(context, value, **options)
      context.format(context, value.code, as: :territory, **options)
    end
  end

  module Timezone
    module Meta
      extend self
      # @see Nii::Context#format
      # @!scope module
      def format(context, value, **options)
        raise NotImplementedError
      end
    end

    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end
end
