class Event < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :state, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
end
