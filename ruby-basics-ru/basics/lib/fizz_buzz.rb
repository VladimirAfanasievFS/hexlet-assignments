# frozen_string_literal: true

# BEGIN
def get_word(number)
  fizz = (number % 3).zero? ? 'Fizz' : ''
  buzz = (number % 5).zero? ? 'Buzz' : ''

  "#{fizz}#{buzz}"
end

def fizz_buzz(start, stop)
  return nil if start > stop

  arr = (start..stop).map do |i|
    get_word(i).empty? ? i : get_word(i)
  end

  arr.join(' ')
end
# END
