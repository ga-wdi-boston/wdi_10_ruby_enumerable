require 'enum/basic_enum'
require 'enum/arrays'
require 'enum/nested'

class MyEnumeration

  attr_reader :inArr
  def initialize(inArr)
    @inArr = inArr
  end

  def number_of_elements_in_collection
    inArr.count
  end

   def number_of_floats_or_fixnums
     inArr.map{|elem| elem.is_a?(Numeric)}.count(true)
  end

end
