require 'rails_helper'

RSpec.describe Message, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:amount) }

    it 'does accept positive amount only' do
      message = Message.new(
        first_name: 'Magda',
        last_name: 'Smith',
        email: 'magda@example.com'
      )
      message.amount = -100
      expect(message).to_not be_valid

      message.amount = 100
      expect(message).to be_valid
    end

    it 'does not accept invalid emails' do
      message = Message.new(
        first_name: 'Magda',
        last_name: 'Smith',
        amount: 1000
      )
      message.email = 'wrongemail.com'
      expect(message).to_not be_valid

      message.email = 'magda@example.com'
      expect(message).to be_valid
    end
  end

end
