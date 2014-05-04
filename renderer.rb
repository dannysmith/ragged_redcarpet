require 'redcarpet'

class MyRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def paragraph(text)
    # Just render the usual text and add a &nbsp between the last two words
    "<p>#{text.reverse.split(" ", 2).join('&nbsp;'.reverse).reverse}</p>\n\n"
  end

  # Prevent Bold, Emphasised or Linked text breaking if it's short.
  def emphasis(text)
    "<em>#{do_not_break_string(text)}</em>"
  end

  def double_emphasis(text)
    "<strong>#{do_not_break_string(text)}</strong>"
  end

  def link(link, title, content)
    "<a href=\"#{link}\" title=\"#{title}\">#{do_not_break_string(content)}</a>"
  end

  def normal_text(text)
    "#{process_text text}"
  end

  private

  # Replace spaces with nbsps if tring has less than the required number of words
  def do_not_break_string(min_words = 3, text)
    if text.split.size <= min_words
      text = text.split.join('&nbsp;')
    end
    return text
  end

  # Add &nbsp; to paragraph to meet the following rules:
  # 1. Never break after a preposition
  # 2. Never break after a dash
  # 3. Never break after a short word
  def process_text(text)
    regexp = /(?:\s|^|>)(?<word>(\w{0,3}|[-–—]|\&ndash\;|\&mdash\;|aboard|about|above|across|after|against|along|amid|among|anti|around|before|behind|below|beneath|beside|besides|between|beyond|concerning|considering|despite|down|during|except|excepting|excluding|following|from|inside|into|like|minus|near|onto|opposite|outside|over|past|plus|regarding|round|save|since|than|that|this|through|toward|towards|under|underneath|unlike|until|upon|versus|with|within|without)(?<space>\s))/i
    text = text.gsub(regexp).each {|m| "#{m[0..-2]}&nbsp;"}
  end
end
