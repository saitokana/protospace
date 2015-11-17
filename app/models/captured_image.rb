class CapturedImage < ActiveRecord::Base
  enum role: [:main, :sub]
  mount_uploader :name, ImageUploader
  belongs_to :prototype
end
