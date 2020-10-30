class MenuImage < ApplicationRecord
  belongs_to :menu, optional: true
  mount_uploader :image, ImageUploader
end
