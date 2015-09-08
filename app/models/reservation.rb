class Reservation < ActiveRecord::Base
  attr_accessor :morning_discovery_cruise, :sunset_cocktail_cruise, :island_hopping

  validates :name, :message, :email,
            presence: true
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})|[\d\s()+-.*]+\Z/i }

  before_save :copy_cruise_options

  def copy_cruise_options
    write_attribute :cruise_type, %i[morning_discovery_cruise sunset_cocktail_cruise island_hopping].map { |attr|
      attr.to_s.humanize if public_send(attr) == '1'
    }.compact.join(', ')
  end
end
