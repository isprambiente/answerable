# Manage answer data.
#
# Relations::
#   - belongs to :answerable, polymorphic
#   - belongs to :question
#
# @!attribute [rw] answerable_id
#   @return [Integer]
#   Reference id for answerable
# @!attribute [rw] answerable_type
#   @return [String]
#   Reference model name for answerable
# @!attribute [rw] question_id
#   @return [Integer]
#   Reference id for question
# @!attribute [rw] value 
#   @return [String]
#   answer value, mandatory

class Answerable::Answer < ApplicationRecord
  belongs_to :answerable, polymorphic: true
  belongs_to :question

  has_one_attached :file

  delegate :mandatory?, :category_select?, :file_select?, to: :question
  delegate :editable?,  to: :answerable

  validates :value, presence: true, if: :mandatory?
  validates :value, inclusion: { in: :choices }, if: :category_select?
  validates :editable?, acceptance: { accept: [true] }

  def choices
    question.choices.selectables.pluck :value
  end
end
