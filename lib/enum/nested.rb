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
  def initialize(people_array)
    @people = people_array
  end

  def ages_sum
    @people.reduce(0) {|sum,person| sum+person.age}
  end

  def average_age
    ages_sum/@people.length
  end

  def total_years_programming_experience_for_all_languages
    @people.reduce(0) {|group_sum,person| 
      group_sum+person.years_language_experience.values.reduce(:+)
    }
  end

  def favorite_food_frequency
    @people.each_with_object(Hash.new(0)){|person,histogram|
      person.favorite_foods.each_with_object(histogram){|food, histogram| histogram[food] += 1 || 0 }
    }
  end

  def total_combined_years_language_experience(language)
    @people.reduce(0) {|sum,person| sum+(person.years_language_experience[language] || 0)}
  end

  def person_with_most_experience_in_language(language) #This wasn't covered by the given tests, but I'll try it anyway.
    @people.select{|person| person.years_language_experience[language] != nil}.max_by{|person| person.years_language_experience[language]}
  end

  private

  def people
    @people
  end

end
