class Array

  def sum_of_numeric_elements
    self.select {|x| x.is_a?(Numeric)}.inject(:+)
  end

  def product_of_numeric_elements
    self.select {|x| x.is_a?(Numeric)}.inject(:*)
  end

  def even_numeric_elements
    self.select {|x| x.is_a?(Fixnum)}.select {|x| x.even?}
  end

  def odd_numeric_elements
    self.select {|x| x.is_a?(Fixnum)}.select {|x| x.odd?}
  end

  def string_elements
    self.select {|x| x.is_a?(String)}
  end

  def lowercase_string_elements_as_uppercase
    self.select {|x| x.is_a?(String)}.select {|x| x ==x.downcase}.map {|x| x.capitalize}
  end

  def capitalized_elements
    self.select {|x| x.is_a?(String)}.reject {|x| x == x.downcase}
  end

end
