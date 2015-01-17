require 'pry-byebug'
class Array

  def sum_of_numeric_elements
    select { |e| e.is_a? Numeric }.reduce(:+)
  end

  def product_of_numeric_elements
    select { |e| e.is_a? Numeric }.reduce(:*)
  end

  def even_numeric_elements
    select { |e| (e.is_a? Fixnum) && (e % 2 == 0)}
  end

  def odd_numeric_elements
    select { |e| (e.is_a? Fixnum) && (e % 2 != 0)}
  end

  def string_elements
    select {|e| e.is_a? String}
  end

  def lowercase_string_elements_as_uppercase
    select {|e| e =~ /\A[a-z](...)/}.map(&:capitalize)
  end

  def capitalized_elements
    select {|e| e =~ /\A[A-Z](...)/}
  end

end


