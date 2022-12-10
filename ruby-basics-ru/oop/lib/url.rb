# frozen_string_literal: true

require 'forwardable'
require 'uri'

# BEGIN
class Url
  attr_accessor :url

  extend Forwardable
  include Comparable

  def initialize(string)
    @url = URI.parse(string)
  end

  def <=>(other)
    s1 = to_s
    s2 = other.to_s

    return 0 if s1 == s2

    s1 > s2 ? 1 : -1
  end

  def_delegators :@url, :host, :scheme, :to_s

  def query_params
    return {} if @url.query.nil?

    @url.query.split('&').reduce({}) do |acc, i|
      key, value = i.split('=')
      acc.merge({ "#{key}": value })
    end
  end

  def query_param(key, default = nil)
    query_params[key] ||= default
  end
end
