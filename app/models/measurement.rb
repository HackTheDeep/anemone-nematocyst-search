class Measurement < ApplicationRecord
  belongs_to :image
  belongs_to :feature
end
