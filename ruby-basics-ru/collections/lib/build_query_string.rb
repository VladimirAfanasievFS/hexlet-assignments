# frozen_string_literal: true

# BEGIN

def build_query_string(options = {})
  options.entries.sort_by { |a| a[0] }.map do |key, value|
    "#{key}=#{value}"
  end.join('&')
end

# END
