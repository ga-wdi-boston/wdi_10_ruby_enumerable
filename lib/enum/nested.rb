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
    @people.inject(0){ |sum, person| sum + person.age }
  end

  def average_age
    ages_sum / @people.count
  end

  def total_years_programming_experience_for_all_languages
    # @people.inject(0) do |sum, person|
    # sum += person.years_language_experience.inject(0){ |sum, language| sum += @years_language_experience[language] }
    # end
    @people.flat_map{ |person| person.years_language_experience }.inject(0){ |sum, years| sum + years }
  end

  def favorite_food_frequency
    @people.flat_map{ |person| person.favorite_foods}.each_with_object(Hash.new(0)){ |food, hash| hash[food] += 1 }
  end

  def total_combined_years_language_experience(language)
    @people.inject(0){ |person| person.years_language_experience}
  end

  def person_with_most_experience_in_language(language)
    @people.max_by{}
  end

  private

  def people
    @people
  end

end
