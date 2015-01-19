class Array

  #Sums all Float and Fixnum elements
  def sum_of_numeric_elements
    select{ |num| num.is_a?(Numeric) }.reduce(:+)
  end
  #Multiplies all Float and Fixnum elements
  def product_of_numeric_elements
    select{ |num| num.is_a?(Numeric) }.reduce(1, :*)
  end
  #Returns only even Fixnum elements
  def even_numeric_elements
    select{ |num| num.is_a?(Fixnum) && num.even? }
  end
  #Returns only odd Fixnum elements
  def odd_numeric_elements
    select{ |num| num.is_a?(Fixnum) && num.odd? }
  end
  #Returns only String elements
  def string_elements
    select{ |elem| elem.is_a?(String)}
  end
  #Returns String elements that are lowercase in uppercase
  def lowercase_string_elements_as_uppercase
    select{ |elem| elem.is_a?(String) && elem.match(/\b[a-z]/)}.map(&:capitalize)
  end
  #Returns String elements that are uppercase
  def capitalized_elements
    select{ |elem| elem.is_a?(String) && elem.match(/\b[A-Z]/)}
  end

end
