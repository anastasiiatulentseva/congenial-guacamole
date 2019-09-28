class Message < ApplicationRecord

  validates_presence_of :first_name, :last_name, :email, :amount
  validate :amount_should_be_positive_number

  def amount_should_be_positive_number
    errors.add(:amount, "should be a positive number") if amount < 0
  end

end
