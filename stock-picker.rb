def stock_picker prices
  possible_values = get_possible_values prices
  highest_profit = 0
  pair_index = nil

  possible_values.each_with_index do |set, index|
    profit = prices[set.last] - prices[set.first]
    if highest_profit < profit
      highest_profit = profit
      pair_index = index
    end
  end

  pair_index ? possible_values[pair_index] : "There wasn't a profit opportunity!"
end

def get_possible_values prices
  possible_values = []
  prices.each_with_index do |possible_min_price, possible_min_index|
    max_index = nil
    prices.each_with_index do |possible_max_price, possible_max_index|
      next if possible_min_index >= possible_max_index
      
      if max_index and possible_max_price > prices[max_index]
        max_index = possible_max_index
      elsif !max_index and possible_max_price > possible_min_price
        max_index = possible_max_index
      end
    end

    if max_index
      possible_values << [possible_min_index, max_index]
    end
  end
  possible_values
end

pp stock_picker [17,3,6,9,15,8,6,1,10]