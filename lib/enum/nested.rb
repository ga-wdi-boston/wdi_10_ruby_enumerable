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
    @people.map { |person| person.age}.inject(:+)
  end

  def average_age
    @people.map { |person| person.age}.inject(:+) / @people.count
  end

  def total_years_programming_experience_for_all_languages
     @people.flat_map { |person| person.years_language_experience.values}.inject(:+)
  end

  def favorite_food_frequency
    @people.flat_map { |person| person.favorite_foods}.each_with_object(Hash.new(0)) { |count, food| food[count] += 1 }
  end

  def total_combined_years_language_experience(language)
    @people.flat_map { |person| person.years_language_experience[language]}.compact!.inject(:+)
  end

  def person_with_most_experience_in_language(language)
    dum = @people.select { |person| person.years_language_experience[language]}.max { |person| person.years_language_experience[language]}.name
  end

  private

  def people
    @people
  end

end
