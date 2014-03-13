class Word

  def Word.create(word)
    new_word = Word.new(word)
    new_word.save
    new_word
  end

  def initialize(word)
    @word_array = []
    @word = word
  end

  def word_array
    @word_array
  end

  def word
    @word
  end

  def save
    @word_array << self.word
  end

  def edit_word(new_word)
    @word = new_word
  end

end
