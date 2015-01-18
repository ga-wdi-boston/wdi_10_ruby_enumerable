# Don't modify the Person class
require 'pry'
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
    @people.map { |item| item.age }.reduce(:+)
  end

  def average_age
    @people.map { |item| item.age}.inject { |memo, item| memo + item }.to_f / @people.length
  end

  def total_years_programming_experience_for_all_languages
    @people.map { |item| item.years_language_experience.values }.flatten.reduce(:+)
  end

  def favorite_food_frequency
    @people.map(&:favorite_foods).flatten.each_with_object(Hash.new(0)) { |item, hash| hash[item] += 1 }
  end

  def total_combined_years_language_experience(language)
    @people.map { |item| item.years_language_experience[language] }.compact.reduce(:+)
  end

  def person_with_most_experience_in_language(language)
    # binding.pry
    @people.each_with_object(Hash.new(0)) { |person, years| years[person.name] = person.years_language_experience[language] }.delete_if { |key, value| value == nil }.max_by {|key,value| value }[0]
  end

  private

  def people
    @people
  end

end
