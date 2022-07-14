class Answerable::Answer < ApplicationRecord
  belongs_to :answerable, polymorphic: true
  belongs_to :question
end
