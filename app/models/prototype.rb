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

  def update_captured_images(captured_image)
    captured_image.each do |k, v|
     k == '0' ? captured_images.main.first.update(name: v[:name]) : captured_images.sub[k.to_i - 1].update(name: v[:name])
    end
  end


  paginates_per 8

end
