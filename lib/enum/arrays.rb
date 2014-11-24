class Array

  def sum_of_numeric_elements
    self.select{|element| [Fixnum,Float].include? element.class}.reduce(:+)
  end

  def product_of_numeric_elements
    self.select{|element| [Fixnum,Float].include? element.class}.reduce(:*)
  end

  def even_numeric_elements
    self.select{|element| element.class == Fixnum && element%2 == 0}
  end

  def odd_numeric_elements
    self.select{|element| element.class == Fixnum && element%2 != 0}
  end

  def string_elements
    self.select{|element| element.class == String}
  end

  def lowercase_string_elements_as_uppercase
    self.select{|element| element.class == String && element == element.downcase}.map{|word| word.capitalize}
  end

  def capitalized_elements
    self.select{|element| element.class == String && element.split(" ") == element.split(" ").map{|word| word.capitalize}}
  end

end
