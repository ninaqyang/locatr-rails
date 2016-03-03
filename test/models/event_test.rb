require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should belong_to :user
  should validate_presence_of :title
  should validate_presence_of :address1
  should validate_presence_of :address2
  should validate_presence_of :city
  should validate_presence_of :state
  should validate_presence_of :zip
  should validate_presence_of :state
  should validate_presence_of :latitude
  should validate_presence_of :longitude
  should validate_presence_of :starts_on
  should validate_presence_of :ends_on
end
