class Product
  attr_accessor :product_name

  FREE_TAX_PRODUCTS = ['book', 'chocolate', 'pill']
  def initialize(product_name)
    @product_name = product_name
  end

  def get_sale_tax_rate()
    tax = 0

    tax = FREE_TAX_PRODUCTS.any? { |word| @product_name.include?(word) } ? tax : tax + 0.1

    if @product_name.include?('imported')
      tax += 0.05
    end

    tax
  end

end
