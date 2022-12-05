# frozen_string_literal: true

# BEGIN

def prepare(word)
  word.chars.sort.join
end

def anagramm_filter(word, banWords)
  banWords.filter do |i|
    prepare(i) == prepare(word)
  end
end
# END
