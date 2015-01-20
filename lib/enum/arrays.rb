class Array

  def sum_of_numeric_elements
    (self.group_by(&:class)[Fixnum] + self.group_by(&:class)[Float]).inject(:+)
  end

  def product_of_numeric_elements
    (self.group_by(&:class)[Fixnum] + self.group_by(&:class)[Float]).inject(:*)
  end

  def even_numeric_elements
    #only even fixnum
    self.group_by(&:class)[Fixnum].select {|x| x.even? }
  end

  def odd_numeric_elements
    self.group_by(&:class)[Fixnum].select {|x| x%2 != 0 } # wanted to try another method from .even? above
  end

  def string_elements
    self.group_by(&:class)[String]
  end

  def lowercase_string_elements_as_uppercase
    self.group_by(&:class)[String].select { |str| str == str.downcase }.collect(&:capitalize)
  end

  def capitalized_elements
    self.group_by(&:class)[String].select { |str| str == str.split.map(&:capitalize).join(' ') }
    #self.group_by(&:class)[String].split(/ |\_/).map(&:capitalize).join(" ")
  end

end
