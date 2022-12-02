# frozen_string_literal: true

def make_censored(text, stop_words)
  # BEGIN
  text.split.map do |i|
    stop_words.include?(i) ? '$#%!' : i
  end.join(' ')
  # END
end
