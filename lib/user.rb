class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(new_joke)
    @jokes << new_joke
  end

  def tell(joke_receiver, shared_joke)
    if @jokes.include? shared_joke
      joke_receiver.jokes << shared_joke
    else
      "I don't know that joke."
    end
  end

  def joke_by_id(id_number)
    @jokes.find do |joke|
      joke.id == id_number
    end
  end
end
