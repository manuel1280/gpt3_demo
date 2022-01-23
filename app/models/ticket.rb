class Ticket < ApplicationRecord
  require './lib/gpt3'
  belongs_to :user
  validates :body, presence: true

  before_save :classify

  private

  def classify
    label = Gpt3.classify(body)
    self.category = label
  end
end
