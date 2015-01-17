# Don't modify the Person class
require 'pry-byebug'
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
    @people.map{ |person| person.age }.reduce(:+)
  end

  def average_age
    @people.map{ |person| person.age }.reduce(:+) / @people.length
  end

  def total_years_programming_experience_for_all_languages
    @people.map{ |person| person.years_language_experience.values.reduce(:+) }.reduce(:+)
  end

  def favorite_food_frequency
    @people.map { |person| person.favorite_foods.each_with_object(Hash.new(0)) {|food, count| count[food] += 1} }.inject{|memo, el| memo.merge(el){|k, old, new_v| old += new_v}}
  end

  def total_combined_years_language_experience(language)
    @people.map{ |person| person.years_language_experience[language]}.compact.reduce(:+)
  end

  def person_with_most_experience_in_language(language)
    @people.each_with_object(Hash.new(0)){|person, years| years[person.name] = person.years_language_experience[language]}.delete_if{|k,v| v == nil}.max[0]
  end

  private

  def people
    @people
  end

end


