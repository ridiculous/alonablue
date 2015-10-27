class Reservation < ActiveRecord::Base
  attr_accessor :e_field
  attr_accessor :morning_discovery_cruise, :sunset_cocktail_cruise, :island_hopping
  validates :name, :message, :email,
            presence: true
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})|[\d\s()+-.*]+\Z/i }
  validate :not_spam

  before_save :set_cruise_type

  def set_cruise_type
    write_attribute :cruise_type, %i[morning_discovery_cruise sunset_cocktail_cruise island_hopping].map { |attr|
      attr.to_s.humanize if public_send(attr) == '1'
    }.compact.join(', ')
  end

  def not_spam
    errors[:base] << 'Hidden field should be blank' if e_field.present?
  end
end
