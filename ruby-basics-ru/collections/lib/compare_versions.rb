# frozen_string_literal: true

# BEGIN

# END
def compare_versions(ver1, ver2)
  maj1, min1 = ver1.split('.')
  maj2, min2 = ver2.split('.')

  return 1 if maj1.to_i > maj2.to_i
  return 1 if min1.to_i > min2.to_i

  return 0 if maj1.to_i == maj2.to_i && min1.to_i == min2.to_i

  -1
end
