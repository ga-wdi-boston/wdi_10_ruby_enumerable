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
    people.reduce(0) do |sum, person|
      sum + person.age
    end
  end

  def average_age
    ages_sum / people.length
  end

  def total_years_language_experience(person)
    person.years_language_experience.values.reduce(:+)
  end

  def total_years_programming_experience_for_all_languages
    people.reduce(0) do |sum, person|
      sum + total_years_language_experience(person)
    end
  end

  # idea:
  # make a flat map of all the foods of each person
  # i.e. something like ['sushi', 'barbeque', 'pizza', 'barbeque', 'burgers', 'burgers']
  # and then call each_with_object on that

  def favorite_food_frequency
    all_favorite_foods.each_with_object(Hash.new(0)) do |food, object|
      object[food] += 1
    end
  end

  def all_favorite_foods
    people.flat_map do |person|
      person.favorite_foods
    end
  end

  def total_combined_years_language_experience(language)
    people_with_language(language).reduce(0) do |sum, person|
      sum + person.years_language_experience[language]
    end
  end

  def people_with_language(language)
    people.select do |person|
      person.years_language_experience.keys.include?(language)
    end
  end

  def person_with_most_experience_in_language(language)
  end

  private

  def people
    @people
  end

end
