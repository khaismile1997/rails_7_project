class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :password, confirmation: true

  validate :email_unique_across_users_and_clients

  private

  def email_unique_across_users_and_clients
    return if email.blank?
    if User.where(email: email).where.not(id: id).exists? || Client.where(email: email).exists?
      errors.add(:email, 'has already been taken')
    end
  end
end
