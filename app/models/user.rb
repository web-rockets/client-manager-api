class User < ActiveRecord::Base
  has_secure_password
  # Validations
  validates :name, presence: { presence: true, message: 'not_blank' }
  validates :email, uniqueness: { uniqueness: true, message: 'already_exists'}

  scope :without, -> (*columns) { select(attribute_names - columns) }
  scope :without_password, -> { without('password_digest') }
end
