class Term

  @@dictionary_array = []

  def Term.clear
    @@dictionary_array = []
  end

  def Term.all
    @@dictionary_array
  end

  def Term.create(word, definition)
    new_entry = Term.new(word, definition)
    @@dictionary_array << new_entry
    new_entry
  end

  def Term.search(word)
    array = []
    Term.all.each { |term| term.word == word ? array << term : '' }
    array[0]
  end

  def initialize(word, definition)
    @word = Word.create(word)
    @definition = Definition.create(definition)
  end

  def word
    @word
  end

  def definition
    @definition
  end

end
