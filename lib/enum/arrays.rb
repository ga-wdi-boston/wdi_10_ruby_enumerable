class Array

  def sum_of_numeric_elements
    select { |item| item.is_a? Numeric }.reduce(:+)
  end

  def product_of_numeric_elements
    select { |item| item.is_a? Numeric }.reduce(:*)
  end

  def even_numeric_elements
    select { |item| (item.is_a? Fixnum) && (item.even?) }
  end

  def odd_numeric_elements
    select { |item| (item.is_a? Fixnum) && (item.odd?) }
  end

  def string_elements
    select { |item| item.is_a? String }
  end

  def lowercase_string_elements_as_uppercase
    map { |item| (item.is_a? String) && (item == item.downcase) ? item.capitalize : nil }.compact
  end

  def capitalized_elements
    select { |item| (item.is_a? String) && (item[0] == item[0].upcase) }
  end
end
