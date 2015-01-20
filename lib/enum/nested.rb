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
    people.collect(&:age).inject(:+)
  end

  def average_age
    ages_sum / people.collect(&:age).count
  end

  def total_years_programming_experience_for_all_languages
    people.collect { |x| x.years_language_experience.values.inject(:+)}.inject(:+)
  end

  def favorite_food_frequency
    #people.group_by { |x| x.fetch(&:favorite_foods) }
    people.collect(&:favorite_foods).flatten.each_with_object(Hash.new(0)) {|key, hash| hash[key] += 1 }
  end

  def total_combined_years_language_experience(language)
    people.collect { |x| x.years_language_experience[language]}.compact.inject(:+)
  end

  def person_with_most_experience_in_language(language)
    people.max_by { |x| x.years_language_experience[language].to_i}.name
  end

  private

  def people
    @people
  end

end
