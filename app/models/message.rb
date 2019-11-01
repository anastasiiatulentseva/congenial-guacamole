# frozen_string_literal: true

class Message < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :amount
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :amount, :numericality => { greater_than_or_equal_to: 0 }

  after_create :process_message

  scope :processed, -> {where processed: true}

  def process_message
    RecordsWorker.perform_async(id)
  end

end
