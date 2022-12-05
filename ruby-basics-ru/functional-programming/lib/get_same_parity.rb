# frozen_string_literal: true

# BEGIN

def get_same_parity(arr)
  arr.filter { |el| el.even? == arr[0].even? }
end
# END
