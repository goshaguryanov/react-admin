class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_many :permissions
  ROLES = %w[god security].freeze

  ROLES.each do |r|
    define_method("#{r}?") do
      role == r
    end
  end

  def self.options_for_select
    order("LOWER(email)").pluck(:email, :id)
  end
end
