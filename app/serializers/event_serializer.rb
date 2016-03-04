class EventSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :address1, :address2, :city, :state, :zip,
             :latitude, :longitude, :starts_on, :ends_on, :created_at,
             :updated_at
end
