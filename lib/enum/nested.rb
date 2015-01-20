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
    people.map(&:age).reduce(:+)
  end

  def average_age
    people.map(&:age).reduce(:+) / @people.count
  end

  def total_years_programming_experience_for_all_languages
    people.map{ |people| people.years_language_experience.reduce(:+)}.reduce(:+)
  end

  def favorite_food_frequency
    people.map { |people| people.favorite_foods.count.reduce(:+).object(Hash.new(0))}.inject
  end

  def total_combined_years_language_experience(language)
    people.map { |people| people.years_language_experience.count.reduce(:+)}.reduce(:+)
  end

  def person_with_most_experience_in_language(language)
    people.map { |people| people.years_language_experience.count}.inject
  end

  private

  def people
    @people
  end

end
