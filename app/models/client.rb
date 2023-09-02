class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :payout_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validate :email_unique_across_users_and_clients

  private

  def email_unique_across_users_and_clients
    return if email.blank?
    if Client.where(email: email).where.not(id: id).exists? || User.where(email: email).exists?
      errors.add(:email, 'has already been taken')
    end
  end
end
