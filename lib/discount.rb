require 'mathn'

class Discount

  attr :customers, :products

  def initialize discount_data_hash
    @customers = discount_data_hash[:customers]
    @products = discount_data_hash[:products]
  end

  def calculate_discount
    suitability_scores = {}
    @customers.each do |customer|
      suitability_scores[customer] = {}
      @products.each do |product|
        if product.name_even?
          suitability_scores[customer][product] = customer.vowel_score
        else
          suitability_scores[customer][product] = customer.consonant_score
        end
        if (factors_of(customer.name.gsub(/[^a-zA-Z]/, '').length, true) & factors_of(product.name.gsub(/[^a-zA-Z]/, '').length, true)).size > 0
          suitability_scores[customer][product] *= 1.5
        end
      end
    end
    suitability_scores
  end

  private

  def factors_of number, remove_one = false
    primes, powers = number.prime_division.transpose
    exponents = powers.map{|i| (0..i).to_a}
    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
    end
    divisors.map {|div| [div, number / div] }.flatten.sort!
    divisors.delete(1) if remove_one
    divisors
  end

end
