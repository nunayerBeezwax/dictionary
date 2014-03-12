require 'rspec'
require 'dictionary'

describe 'Term' do

before do
  Term.clear
end

  describe 'Term.clear' do
    it 'clears the dictionary array' do
     test_term = Term.new('word', 'definition')
      Term.clear
      Term.all.should eq []
    end
  end

    describe 'Term.all' do
    it "shows all the words in the dictionary" do
      test_term = Term.create('platypus', 'weird looking animal')
      Term.all.should eq [test_term]
    end
  end

  describe 'Term.search' do
    it "returns the term object for a search term" do
      test_term = Term.create('platypus', 'duck badger')
      Term.search('platypus').should eq test_term
    end
  end

  it 'initializes a new term with word and definition' do
    test_term = Term.new('word', 'definition')
    test_term.should be_an_instance_of Term
  end

  describe "#word" do
    it "displays the word" do
      test_term = Term.new("mountain", "Elevated protrusion of earth")
      test_term.word.should eq "mountain"
    end
  end

  describe '#definition' do
    it 'displays the definition of the word' do
      test_term = Term.new('mountain', 'Elevated protrusion of earth')
      test_term.definition.should eq 'Elevated protrusion of earth'
    end
  end

  describe '#save_def' do
    it 'saves a new definition to a term instance' do
      test_term = Term.create('mountain', 'elevated protrusion')
      test_term.def_array.should eq ['elevated protrusion']
    end
  end


end
