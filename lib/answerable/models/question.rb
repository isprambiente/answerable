# Manage question data.
#
# Relations::
#   - belongs to :questionable, polymorphic
#   - has_many :options, dependent: :destroy
#   - has_many :answers, dependent: :destroy
#
# @!attribute [rw] questionable_id
#   @return [Integer]
#   Reference id for questionable
# @!attribute [rw] questionable_type
#   @return [String]
#   Reference model name for questionable
# @!attribute [rw] title
#   @return [String]
#   Title of questions, mandatory
# @!attribute [rw] type
#   @return [String]
#   enum of question typologies
# @!attribute [rw] weight
#   @return [Integer]
#   Question order
# @!attribute [rw] mandatory
#   @return [Boolean]
#   define if the answer is mandatory
# @!attribute [rw] note
#   @return [String]
#   Question text note
class Answerable::Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank

  enum category: [:string, :text, :select, :file], _prefix: true

  validates :title, presence: true
  validates :weight, presence: true
  validates :category, presence: true
  validates :mandatory, inclusion: { in: [true, false], allow_nil: false }
  validates :options, presence: true, if: :category_select?
  validates :options, absence: true, unless: :category_select?

  default_scope { order('weight asc') }
  scope :mandatory, -> { where mandatory: true }
end
