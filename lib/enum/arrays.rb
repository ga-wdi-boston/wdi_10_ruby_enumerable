class Array
  def iniinitialize
    @test_array
  end

  def sum_of_numeric_elements
    self.map{|num|
      if num.is_a? (Numeric)
        num.to_f
      else
        0.00
      end
    }.compact.reduce(:+)
    end

  def product_of_numeric_elements
    self.select{|num| num.is_a? (Numeric)}.inject(:*)

  end

  def even_numeric_elements
    (self.select{|num| num.is_a? (Numeric)}).map{
        |new_num| new_num.round(0)}.map{|fun|
          if fun.even?
            fun
          else
            nil
          end}.compact
  end

  def odd_numeric_elements
        (self.select{|num| num.is_a? (Numeric)}).map{
        |new_num| new_num.round(0)}.map{|fun|
          if fun.odd?
            fun
          else
            nil
          end}.compact.uniq
  end

  def string_elements
    self.map{|word|
      if word.is_a? (String)
        word
      else
        nil
      end
      }.compact

  end

  def lowercase_string_elements_as_uppercase
        (self.map{|word|
      if word.is_a? (String)
        word
      else
        nil
      end
      }.compact).map{|down|
        if down.include?(down.downcase)
          down.capitalize
        else
          nil
        end

        }.compact
  end

  def capitalized_elements
        (self.map{|word|
      if word.is_a? (String)
        word
      else
        nil
      end
      }.compact).map{|down|
        if down != down.downcase
          down
        else
          nil
        end

        }.compact
  end

end
