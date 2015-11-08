class Prototype < ActiveRecord::Base
  belongs_to :users
  validates_presence_of :user_id, :title, :catch_copy, :concept
  has_many :captured_images
  accepts_nested_attributes_for :captured_images
end
