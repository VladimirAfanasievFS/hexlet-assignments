# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  str.each_char do |i|
    result = "#{i}#{result}"
  end
  result
end
# END
