# frozen_string_literal: true

module CurrencyHelper
  def to_currency(number)
    format('%.2f', number)
  end
end
