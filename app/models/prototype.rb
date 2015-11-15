class Prototype < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :title, :catch_copy, :concept
  has_many :captured_images
  accepts_nested_attributes_for :captured_images

  def main_image
    captured_images.main.first.name
  end

  def sub_images
    captured_images.sub.map(&:name)
  end

  def posted_date
    created_at.strftime("%b %d")
  end

  def create_captured_images(captured_image)
    captured_image.each{ |k, v| k == "main" ? captured_images.main.create(name: v) : captured_images.sub.create(name: v) }
  end

  def destroy_image(prototype)
    if captured_images.main.count == 2
      captured_images.main.find_by(prototype_id: prototype.id).destroy
    end
    while captured_images.sub.count >= 4 do
      captured_images.sub.find_by(prototype_id: prototype.id).destroy
    end
  end


  paginates_per 8

end
