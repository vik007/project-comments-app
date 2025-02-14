class User < ApplicationRecord
  # Include default Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  has_many :comments, dependent: :destroy

  # Concise name method
  def name
    [ first_name, last_name ].compact.join(" ")
  end

  # Optimize session serialization
  def self.serialize_from_session(key, salt = nil)
    find_by(id: key)&.tap do |record|
      return record if !salt || record.authenticatable_salt == salt
    end
  end
end
