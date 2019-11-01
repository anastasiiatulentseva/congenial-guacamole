# frozen_string_literal: true

class SalesReportsController < ApplicationController
  def index
    @records = Message.processed.order(created_at: :desc)
  end
end
