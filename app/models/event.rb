class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :venue, presence: true
end
