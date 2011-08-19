class Customer

  attr_accessor :name

  def initialize name
    @name = name
  end

  def vowel_score
    name.gsub(/[^aeiouyAEIOUY]/, '').length.to_f * 1.5
  end

  def consonant_score
    name.gsub(/[aeiouyAEIOUY]/, '').length.to_f
  end

end
