# frozen_string_literal: true

class Errors::ValidationErrorsSerializer < Errors::BaseErrorsSerializer
  attributes :errors

  def errors
    return object.messages if object.is_a?(ActiveModel::Errors)
    object.errors.messages
  end
end
