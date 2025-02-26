require './lib/joke'
require './lib/user'

RSpec.describe User do
  it 'exists' do
    user_1 = User.new("Sal")

    expect(user_1).to be_a(User)
  end

  it 'has a name' do
    user_1 = User.new("Sal")

    expect(user_1.name).to eq("Sal")
  end

  it 'has jokes' do
    user_1 = User.new("Sal")

    expect(user_1.jokes).to eq([])
  end

  it 'learns jokes' do
    user_1 = User.new("Sal")
    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")
    user_1.learn(joke_1)

    expect(user_1.jokes.length).to eq(1)

    user_1.learn(joke_2)

    expect(user_1.jokes.length).to eq(2)
    expect(user_1.jokes).to eq([joke_1, joke_2])
  end

  it 'tells joke to other user' do
    user_1 = User.new("Sal")
    user_2 = User.new("Ali")
    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")
    joke_3 = Joke.new(10, "Why did the chicken cross the road?", "To get to the other side.")
    user_1.learn(joke_1)
    user_1.learn(joke_2)
    user_1.tell(user_2, joke_1)
    user_1.tell(user_2, joke_2)

    expect(user_2.jokes.length).to eq(2)
    expect(user_2.jokes).to eq([joke_1, joke_2])
    expect(user_1.tell(user_2, joke_3)).to eq("I don't know that joke.")
    expect(user_2.jokes.length).to eq(2)
  end

  it 'can find joke by id number' do
    user_1 = User.new("Sal")
    user_2 = User.new("Ali")
    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")
    joke_3 = Joke.new(10, "Why did the chicken cross the road?", "To get to the other side.")
    user_1.learn(joke_1)
    user_1.learn(joke_2)
    user_1.tell(user_2, joke_1)
    user_1.tell(user_2, joke_2)

    expect(user_2.joke_by_id(22)).to eq(joke_1)
    expect(user_2.joke_by_id(13)).to eq(joke_2)
  end
end
