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
    people.map{|person| person.age}.inject(:+)
  end

  def average_age
    people.ages_sum / people.length
  end

  def total_years_programming_experience_for_all_languages
    people.map{|person| person.years_language_experience.values}.flatten.inject(:+)
  end

  def favorite_food_frequency
    people.map {|person| person.favorite_foods}.flatten.group_by{|i| i}.each_value{|value| value.count}
  end

  def total_combined_years_language_experience(language)
    people.map {|person| person.years_language_experience.values}
  end

  def person_with_most_experience_in_language(language)
    people.map{|person| person.years_language_experience.values}.map{|years| years.inject(:+)}
  end

  private

  def people
    @people
  end

end
