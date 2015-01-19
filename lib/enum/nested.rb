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
    @people.reduce(0) { |memo,item| memo += item.age }
  end

  def average_age
    # @people.reduce(:) { |memo, item| memo += item.age}
    @people.reduce(0) { |memo, item| memo += item.age } / @people.size
  end

  def total_years_programming_experience_for_all_languages
    @people.reduce(0) do |memo, item|
      memo += item.years_language_experience.reduce(0) { |sum, language| sum += language[1] }
    end
  end

  def favorite_food_frequency
    # collection.each_with_object(Hash.new(0)) { |key, value| value[key] += 1 }
    # people.each_with_object(Hash.new(0)) { |key, hash| hash[key.favorite_foods] += 1 }
    people.map { |person| person.favorite_foods }.flatten.each_with_object(Hash.new(0)) { |sum, hash| hash[sum]+=1 }

    # (1..10).each_with_object([]) { |i, a| a << i*2 }
  end

  def total_combined_years_language_experience(language)
    people.map { |person| person.years_language_experience[language] }.compact.reduce(:+)
  end

  def person_with_most_experience_in_language(language)
    people.max_by { |person| person.years_language_experience[language].to_i }.name
  end

  private

  def people
    @people
  end

end
