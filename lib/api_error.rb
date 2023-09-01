module ApiError
  class Base < StandardError
    include ActiveModel::Serialization

    attr_reader :reason, :message

    def initialize
      @error = self.class.name.gsub("::", ".").underscore
      error_type = I18n.t @error
      error_type.each do |attr, value|
        instance_variable_set("@#{attr}".to_sym, value)
      end
    end
  end

  class RecordInvalid < StandardError
    attr_reader :record

    def initialize(errors)
      @record = errors
    end
  end

  class Unauthorized < ApiError::Base
  end
end
