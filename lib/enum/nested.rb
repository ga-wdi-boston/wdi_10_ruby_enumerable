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
    people.map {|x| x.age}.inject(:+)
  end

  def average_age
    people.map {|x| x.age}.inject(:+).to_f / people.size
  end

  def total_years_programming_experience_for_all_languages
    people.map {|x| x.years_language_experience}.flat_map(&:values).inject(:+)
  end

  def favorite_food_frequency
    people.map {|x| x.favorite_foods}.flatten.each_with_object(Hash.new(0)) {|count, food| food[count]+=1}
  end

  def total_combined_years_language_experience(language)
    people.map {|x| x.years_language_experience[language]}.compact.inject(:+)
  end

  def person_with_most_experience_in_language(language)
    people.max_by {|x| x.years_language_experience[language].to_i}.name
  end

  private

  def people
    @people
  end

end
