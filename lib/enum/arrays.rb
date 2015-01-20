class Array

  def sum_of_numeric_elements
    select{|num| num.is_a? Numeric}.inject(:+)
  end

  def product_of_numeric_elements
    select{|element| element.is_a? Numeric}.inject(:*)
  end

  def even_numeric_elements
    select{|number| (number.is_a? Fixnum) && (number % 2 == 0)}
  end

  def odd_numeric_elements
    select{|number| (number.is_a? Fixnum) && (number % 2 != 0)}
  end

  def string_elements
    select{|element| element.is_a? String}
  end

  def lowercase_string_elements_as_uppercase
    select{|element| element =~ /\b[a-z]/}.map(&:capitalize)
  end

  def capitalized_elements
    select{|element| element =~ /\b[A-Z]/}
  end

end
