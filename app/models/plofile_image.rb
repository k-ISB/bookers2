class PlofileImage < ApplicationRecord
  belongs_to :user
  attachment :image
end
