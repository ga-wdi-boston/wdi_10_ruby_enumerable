# Don't modify the Person class
class Person
  attr_accessor :name, :age, :gender, :years_language_experience, :favorite_foods

  def initialize(name:, age:, gender:, years_language_experience:{}, favorite_foods:[])
    @name = name
    @age = age
    @gender = gender
    @years_language_experience = years_language_experience
    @favorite_foods = favorite_foods
  end
end


class People

  attr_reader :people
  def initialize(people_array)
    @people = people_array
  end
  #Returns a sum of ages from a struct of classes
  def ages_sum
    people.reduce(0){|sum, info| sum +=info.age }
  end
  #Returns an average of ages from a struct of classes
  def average_age
    people.reduce(0){|sum, info| sum +=info.age }/people.length
  end
  #Returns the total yr programming  from a struct of classes
  def total_years_programming_experience_for_all_languages
    people.map{ |info,yrs| info.years_language_experience.values }.flatten!.reduce(:+)
  end
  #Returns a hash of food frequencies from a struct of classes
  def favorite_food_frequency
    people.map{|info, foodArr| info.favorite_foods }.flatten!.each_with_object(Hash.new(0)){ |key, freq_hash| freq_hash[key] += 1 }
  end
  #Returns the combined yrs from all languages in a struct of classes
  def total_combined_years_language_experience(lang)
     people.map{ |info, years| info.years_language_experience[lang]}.compact.reduce(:+)
    end

  def person_with_most_experience_in_language(language)
    people.max { |per1,per2| per1.years_language_experience[language].to_i <=> per2.years_language_experience[language].to_i }.name
  end

  private

  def people
    @people
  end

end
