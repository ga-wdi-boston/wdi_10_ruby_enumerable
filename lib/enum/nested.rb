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
    people.collect { |person| person.age }.reduce(:+)
  end

  def average_age
    people.collect { |person| person.age }.reduce(:+) / people.count
  end

  def total_years_programming_experience_for_all_languages
    people.collect { |person| person.years_language_experience }
    .collect { |known_languages| known_languages.values }
    .flatten.reduce(:+)
  end

  def favorite_food_frequency
    people.collect { |person| person.favorite_foods }.flatten
    .each_with_object(Hash.new(0)) { |key, hash| hash[key] += 1 }
    # or:
    # people.collect { |person| person.favorite_foods }.flatten
    # .inject(Hash.new(0)) { |hash, key| hash[key] += 1 }
  end

  def total_combined_years_language_experience(language)
    people.collect { |person| person.years_language_experience[language] }
    .compact.reduce(:+)
  end

  def person_with_most_experience_in_language(language)
    people.select { |person| person.years_language_experience[language] }
    .inject { |memo, person| memo.years_language_experience[language] > person.years_language_experience[language] ? memo : person }
  end

  private

  def people
    @people
  end

end
