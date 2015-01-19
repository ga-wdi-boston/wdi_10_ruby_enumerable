require 'enum/basic_enum'
require 'enum/arrays'
require 'enum/nested'

class MyEnumeration

class People

  attr_reader :info
  def initialize(info)
    @info = info
  end

  #Returns a sum of ages from a struct of classes
  def ages_sum
    info.each_with_object([]){ |ind, ages| ages << ind.instance_variable_get(:@age) }.reduce(:+)
  end
  #Returns an average of ages from a struct of classes
  def average_age
    info.each_with_object([]){ |ind, ages| ages << ind.instance_variable_get(:@age) }.reduce(:+)/info.length
  end
  #Returns the total yr programming  from a struct of classes
  def total_years_programming_experience_for_all_languages
    info.each_with_object([]){ |ind, year| year << ind.instance_variable_get(:@years_language_experience).values }.flatten!.reduce(:+)
  end
  #Returns a hash of food frequencies from a struct of classes
  def favorite_food_frequency
    MyEnumeration.new(info.each_with_object([]){ |ind, food| food << ind.instance_variable_get(:@favorite_foods) }.flatten!).element_frequency_count
  end
  #Returns the combined yrs from all languages in a struct of classes
  def total_combined_years_language_experience(lang)

    info.each_with_object([]){ |ind, years| years << ind.instance_variable_get(:@years_language_experience)[lang.to_sym] }.compact.reduce(:+)
    end

end
end
