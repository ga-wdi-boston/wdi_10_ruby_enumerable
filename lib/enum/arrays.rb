class Array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    @array.select { |item| item.class == Fixnum || item.class == Float }.reduce(:+)
  end

  def product_of_numeric_elements
    @array.select { |item| item.class == Fixnum || item.class == Float }.reduce(:*)
  end

  def even_numeric_elements
    # @array.select { |num|  item.class == Fixnum num.even?  }
    @array.select { |item| item.class == Fixnum && item.even? }
  end

  def odd_numeric_elements
    @array.select { |item| item.class == Fixnum && item.odd? }
  end

  def string_elements
    @array.select { |item| item.class == String }
  end

  def lowercase_string_elements_as_uppercase
    string_elements.map do |item|
      if item == item.downcase
        item.capitalize
      end
    end.compact
  end

  def capitalized_elements
    string_elements.reject do |item|
      item == item.downcase
    end
  end

end
