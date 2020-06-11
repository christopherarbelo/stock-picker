def stock_picker prices
  min_index = nil
  max_index = nil
  max_profit = nil

  prices.each_with_index do |possible_min_price, possible_min_index|
    prices.each_with_index do |possible_max_price, possible_max_index|
      next if possible_max_index <= possible_min_index

      if possible_max_price > possible_min_price
        profit = possible_max_price - possible_min_price
        
        if !max_profit or profit > max_profit
          max_profit = profit
          min_index = possible_min_index
          max_index = possible_max_index
        end
      end
    end
  end

  if max_profit
    "Your best opportunity to buy is on day: #{min_index}"\
    " and sell on day: #{max_index} for a profit of $#{max_profit}!"
  else
    "No opportunity to capitalize :("
  end
end

puts "Enter stock prices by day, press ENTER to stop: "
prices = []
day = 0
loop do
  print "Day #{day}: "
  input = gets.chomp
  break if input == ""
  prices << input.to_i
  day += 1
end

puts stock_picker prices