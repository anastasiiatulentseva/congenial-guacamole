# frozen_string_literal: true

class SalesReportsController < ApplicationController
  def index
    @records = Message.all.order(created_at: :desc)
  end
end
