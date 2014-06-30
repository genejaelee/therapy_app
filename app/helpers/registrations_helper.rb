module RegistrationsHelper
  def time_zone_value_to_name(time_zone)
    return ActiveSupport::TimeZone::MAPPING.select {|k, v| v == time_zone }.keys.first
  end
end
