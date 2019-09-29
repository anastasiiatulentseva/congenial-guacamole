module CurrencyHelper

  def to_currency(number)
    sprintf('%.2f', number)
  end

end
