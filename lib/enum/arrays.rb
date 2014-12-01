class Array

  def initialize(collection)
    @collection = collection
  end

  def numeric_elements
    collection.select do |element|
      element.is_a?(Float) || element.is_a?(Fixnum)
    end
  end

  def fixnum_elements
    collection.select do |element|
      element.is_a?(Fixnum)
    end
  end

  def sum_of_numeric_elements
    numeric_elements.reduce do |sum, element|
      sum + element
    end
  end

  def product_of_numeric_elements
    numeric_elements.reduce(1) do |prod, element|
      prod * element
    end
  end

  def even_numeric_elements
    fixnum_elements.select do |element|
      element%2 == 0
    end
  end

  def odd_numeric_elements
    fixnum_elements.select do |element|
      element%2 != 0
    end
  end

  def string_elements
    collection.select do |element|
      element.is_a?(String)
    end
  end

  def lowercase_string_elements_as_uppercase
    string_elements.select do |string|
      string == string.downcase
    end.map do |string|
      string.capitalize
    end
  end

  def capitalized_elements
    string_elements.select do |string|
      string == string.split(' ').map(&:capitalize).join(' ')
    end
  end

  def collection
    @collection
  end

end
