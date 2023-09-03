class BrandPolicy < ApplicationPolicy
  attr_reader :user, :brand

  def initialize(user, brand)
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
