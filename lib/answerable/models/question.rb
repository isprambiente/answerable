class Answerable::Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true
end
