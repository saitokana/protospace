class CapturedImage < ActiveRecord::Base
  enum role: [:main, :sub]
  mount_uploader :name, NameUploader
  belongs_to :prototype
end
