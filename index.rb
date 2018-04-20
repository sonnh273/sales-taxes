#!/usr/bin/env ruby

require_relative "receipt"

require 'csv'

input, output = ARGV

if input.nil?
  puts "You need to provide the path of input CSV file"
else
  arr_of_orders = CSV.read(input)
  arr_of_orders.shift
  receipt = Receipt.new(arr_of_orders)
  receipt.arr_of_orders_with_tax.each do |order_with_tax|
    puts order_with_tax.join(', ')
  end

  puts "Sales Taxes: " + '%.2f' % receipt.sales_taxes.round(2)
  puts "Total: " + '%.2f' % receipt.total.round(2)

end
