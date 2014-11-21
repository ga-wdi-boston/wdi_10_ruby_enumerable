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
    @people.inject(0) { |sum, person| sum += person.age }
  end

  def average_age
    @people.inject(0) { |sum, person| sum += (person.age.to_f / @people.length)}
  end

  def total_years_programming_experience_for_all_languages
    @people.inject(0) do |sum, person|
      sum += person.years_language_experience.inject(0) do |sum2, language|
        sum2 += language[1]
      end
    end
  end

  def favorite_food_frequency
    @people.each_with_object(Hash.new(0)) do |x, y|
      x.favorite_foods.each_with_object(y) do |a, b|
        b[a] += 1
      end
    end
  end

  def total_combined_years_language_experience(language)
    @people.inject(0) { |sum, person| sum += person.years_language_experience[language].to_i }
  end

  def person_with_most_experience_in_language(language)
    # There is no test for this.
  end

  private

  def people
    @people
  end

end
