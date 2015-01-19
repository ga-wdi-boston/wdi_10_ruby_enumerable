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
    @people.inject(0) { |sum, person| sum + person.instance_variable_get(:@age) }
  end

  def average_age
    ages_sum / @people.length
  end

  def total_years_programming_experience_for_all_languages
    @people.inject(0) { |sum, person| sum + person.instance_variable_get(:@years_language_experience).values.inject(:+)}
  end

  def favorite_food_frequency
      @people.map { |person| person.instance_variable_get(:@favorite_foods) }.flatten.each_with_object(Hash.new(0)) {|sum, hash| hash[sum]+=1 }
      #looked up example answer to realize I was missing "flatten" to combine all elements
  end

  def total_combined_years_language_experience(language)
     @people.map { |person| person.instance_variable_get(:@years_language_experience)}.map { |x| x[language]}.compact.reduce(:+)
  end

  def person_with_most_experience_in_language(language)
    @people.max_by { |person| person.years_language_experience[language].to_i}.name
    #looked up example answer and realized I did not need to call a variable with "instance_variable_get"
  end

  private

  def people
    @people
  end

end
