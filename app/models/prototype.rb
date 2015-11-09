class Prototype < ActiveRecord::Base
  belongs_to :users
  validates_presence_of :user_id, :title, :catch_copy, :concept
  has_many :captured_images
  accepts_nested_attributes_for :captured_images

  def main_image
    captured_images.main.first.name
  end

  def sub_image
    captured_images.sub
  end

  def create_captured_images(captured_image)
    captured_image.each{ |k, v| k == "main" ? captured_images.main.create(name: v) : captured_images.sub.create(name: v) }
  end

  paginates_per 8

end
