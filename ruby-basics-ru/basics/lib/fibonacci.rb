# frozen_string_literal: true

# BEGIN
def fibonacci(number)
  return nil if number.negative?

  return 0 if number.zero?
  return 1 if number == 1

  fibonacci(number - 1) + fibonacci(number - 2)
end
# END
