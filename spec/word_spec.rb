require 'rspec'
require 'word'

describe 'word' do

  describe 'create' do
    it 'creates a new word instance' do
      test_word = Word.create('bubble', 'english')
      test_word.should be_an_instance_of Word
    end
  end

  describe '#save' do
    it 'saves the entered words and languages to their respective arrays' do
    test_word = Word.create('bubble', 'english')
    test_word.word_array.should eq [test_word.word]
    test_word.language_array.should eq [test_word.language]
    end
  end
end
