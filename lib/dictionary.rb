class Term

  @@dictionary_array = []

  def Term.clear
    @@dictionary_array = []
  end

  def Term.create(word, definition)
    new_entry = Term.new(word, definition)
    @@dictionary_array << new_entry
    new_entry.save_word
    new_entry.save_def
    new_entry
  end

  def Term.all
    @@dictionary_array
  end

  def Term.search(word)
    array = []
    Term.all.each { |term| term.word == word ? array << term : '' }
    array[0]
  end

  def initialize(word, definition)
    @multi_def_array = []
    @word_array = []
    @word = word
    @definition = definition
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def def_array
    @multi_def_array
  end

  def word_array
    @word_array
  end

  def save_def
    @multi_def_array << self.definition
  end

  def save_word
    @word_array << self.word
  end

  def edit_word(edit_word)
    @word = edit_word
  end

  def edit_definition(edit_definition)
    @definition = edit_definition
  end

end
