# frozen_string_literal: true

class Api::MessagesController < Api::ApiController
  def create
    message = Message.new(message_params)
    if message.save
      render json: { status: 'OK', text: 'Message has been accepted.' }, status: 200
    else
      render json: { status: 'error', text: message.errors.full_messages }, status: 422
    end
  rescue StandardError => e
    render json: { status: 'error', text: e.message }, status: 500
  end

  private

  def message_params
    params.require(:message).permit(:first_name, :last_name, :email, :amount)
  end
end
