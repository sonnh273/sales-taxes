require_relative "product_order"

class Receipt
  attr_accessor :sales_taxes, :total, :arr_of_orders_with_tax
  def initialize(arr_of_orders)
    @product_orders = [];
    @arr_of_orders_with_tax = []
    @total = 0
    @sales_taxes = 0

    arr_of_orders.each do |order|
      product_order = ProductOrder.new(order);

      product_order_with_tax = product_order.get_product_order_with_tax()
      @arr_of_orders_with_tax.push(product_order_with_tax)
      @total += product_order.total
      @sales_taxes += product_order.sales_tax
    end
  end

end
