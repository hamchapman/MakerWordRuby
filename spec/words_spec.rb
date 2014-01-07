describe "Words" do

  it 'knows if a given letter is not in a word' do
    letter = "a"
    word = "hello"
    expect(word_contains_letter word, letter).to be_false
  end 

  it 'knows if a given letter is in a word' do
    letter = "a"
    word = "balloon"
    expect(word_contains_letter word, letter).to be_true
  end 

  it 'knows if a pair of letters are in a word in the given order' do
    letters = ["a", "b"]
    word = "abacus"
    expect(letters_in_word? word, letters).to be_true
  end

  it 'knows if a pair of letters are not in a word in the given order' do
    letters = ["a", "b"]
    word = "balloon"
    expect(letters_in_word? word, letters).to be_false
  end

  it 'knows if a set of 5 letters are in word in the given order' do
    letters = ["e", "t", "g", "a", "z"]
    word = "extravaganza"
    expect(letters_in_word? word, letters).to be_true
  end

end

def word_contains_letter word, letter
  word.include? letter
end

def letters_in_word? word, letters
  return true if letters.length == 1 && word.include?(letters[0])

  if word.include? letters[0]
    rest_of_word = word.split(letters.shift, 2).last
    letters_in_word? rest_of_word, letters
  else
    return false
  end
end
