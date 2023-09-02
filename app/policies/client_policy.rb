class ClientPolicy < ApplicationPolicy
  attr_reader :user, :client

  def initialize(user, client)
    raise ApiError::Unauthorized unless user
    super
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
