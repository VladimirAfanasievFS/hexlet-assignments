# frozen_string_literal: true

module ArticlesHelper
  def articles_index_url
    articles_path
  end
  
  def articles_show_url
    articles_show_path
  end
end
