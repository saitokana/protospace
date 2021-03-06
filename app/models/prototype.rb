class Prototype < ActiveRecord::Base

  validates_presence_of :user_id, :title, :time, :cost

  belongs_to :user
  has_many :captured_images
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :captured_images

  paginates_per 8

  acts_as_taggable

  def main_image
    captured_images.main.first.name
  end

  def sub_images
    captured_images.sub.map(&:name)
  end

  def posted_date
    created_at.strftime('%b %d')
  end

  def create_captured_images(captured_image)
    captured_image.each{ |k, v| k == 'main' ? captured_images.main.create(name: v) : captured_images.sub.create(name: v) }
  end

  def update_captured_images(captured_image)
    captured_image.each do |k, v|
     k == '0' ? captured_images.main.first.update(name: v[:name]) : captured_images.sub[k.to_i - 1].update(name: v[:name])
    end
  end

  def whether_user_liked(user)
    likes.find_by(user_id: user)
  end



end
