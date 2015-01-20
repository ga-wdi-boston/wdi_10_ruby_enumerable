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
    people.map {|person| person.age}.inject(:+)
  end

  def average_age
    people.map {|person| person.age}.inject {|sum, person| sum + person / person}
  end

  def total_years_programming_experience_for_all_languages
    people.map {|person| person.years_language_experience}.map {|memo| memo.to_a}.flatten.select {|elem| elem.is_a?(Numeric)}.inject(:+)
  end

  def favorite_food_frequency
  end

  def total_combined_years_language_experience(language)
  end

  def person_with_most_experience_in_language(language)
  end

  private

  def people
    @people
  end

end
