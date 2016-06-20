class User < ActiveRecord::Base
  has_secure_password
  # Validations
  validates :name, presence: { presence: true, message: 'not_blank' }
  validates :email, uniqueness: { uniqueness: true, message: 'already_exists'}

  scope :without, -> (*columns) { select(attribute_names - columns) }
  scope :without_password, -> { without('password_digest') }

  # This method suppress deprecated warnings from Knock.
  def self.from_token_payload(payload)
    User.find payload['sub']
  end

  # Returns a Hash User without password_digest
  def without_password
    attributes.except 'password_digest'
  end
end
