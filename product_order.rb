require_relative "product"

class ProductOrder
  attr_accessor :sales_tax, :total
  def initialize(product_order)
    @quanlity = product_order[0].to_i
    @product = Product.new(product_order[1])
    @price = product_order[2].to_f
    @sales_tax = (@quanlity * @price * @product.get_sale_tax_rate).money_patch
    @total =@quanlity * @price + @sales_tax
  end



  def get_product_order_with_tax()
    product_order_with_tax = []
    product_order_with_tax[0] = @quanlity
    product_order_with_tax[1] = @product.product_name
    product_order_with_tax[2] = '%.2f' %  @total

    product_order_with_tax
  end

end
