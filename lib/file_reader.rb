require 'pp'

class FileReader

  attr :file

  def initialize file
    @file = file
  end

  def process_file
    File.readlines(@file).each do |testcase|
      discount = Discount.new parse_testcase(testcase.strip)
      pp discount.calculate_discount
    end
  end

  private

  def parse_testcase testcase
    customer_names, product_names = testcase.split(';')
    customer_names = customer_names.split(',')
    product_names = product_names.split(',')
    customers = []
    products = []
    customer_names.each { |customer_name| customers << Customer.new(customer_name) }
    product_names.each { |product_name| products << Product.new(product_name) }
    return { :customers => customers, :products => products }
  end

end
