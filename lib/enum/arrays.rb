class Array

  def sum_of_numeric_elements
    self
      .select { |x| x.class == Float || x.class == Fixnum }
      .reduce(:+)
  end

  def product_of_numeric_elements
    self
      .select { |x| x.class == Float || x.class == Fixnum }
      .reduce(:*)
  end

  def even_numeric_elements
    self
      .select {|x| x.class == Fixnum }
      .select(&:even?)
  end

  def odd_numeric_elements
    self
      .select {|x| x.class == Fixnum }
      .select(&:odd?)
  end

  def string_elements
    self
      .select { |x| x.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase
    string_elements
      .select { |x| x == x.downcase }
      .map(&:capitalize)
  end

  def capitalized_elements
    string_elements
      .select { |x| x[0].match(/[A-Z]/) }
  end

end
