# frozen_string_literal: true

# BEGIN
def count_by_years(arr = [])
  mens = arr.filter { |el| el[:gender] == 'male' }

  mens.reduce({}) do |acc, el|
    year = el[:birthday].slice 0..3
    count = acc.key?(year) ? acc[year] + 1 : 1
    acc.merge({ year => count })
  end
end
# END
