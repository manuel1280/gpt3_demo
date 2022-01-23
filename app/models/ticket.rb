class Ticket < ApplicationRecord
  require './lib/gpt3'
  belongs_to :user
  validates :body, presence: true
  after_create_commit {broadcast_append_to "tickets"}

  before_save :classify

  private

  def classify
    label = Gpt3.classify(body)
    self.category = label
  end
end
