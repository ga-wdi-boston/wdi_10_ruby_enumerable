
class Array
  def sum_of_numeric_elements
    self.select { |x| x.is_a? Numeric }.reduce(:+)
  end

  def product_of_numeric_elements
    self.select { |x| x.is_a? Numeric }.reduce(:*)
  end

  def even_numeric_elements
    self.select { |x| x.is_a? Numeric}.select {|x| x%2 == 0 && x%1 == 0}
  end

  def odd_numeric_elements
    self.select { |x| x.is_a? Numeric}.select {|x| x%2 != 0 && x%1 == 0}
  end

  def string_elements
    self.select { |x| x.is_a? String}
  end

  def lowercase_string_elements_as_uppercase
    self.select {|x| x.is_a? String}.select {|x| x == (x.downcase)}.map {|x| x.capitalize}
  end

  def capitalized_elements
    self.select {|x| x.is_a? String}.select { |x| x != (x.downcase)}
  end

end

