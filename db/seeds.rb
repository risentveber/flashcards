require 'open-uri'

html = Nokogiri::HTML(open("http://w2mem.com/words/en&num=2000"))

nodes = html.css("li[class=input]").slice(0, 30)

nodes.each do |li|
  original = li.css('[name=dst]').attr('value').to_s
  translated = li.css('[name=src]').attr('value').to_s
  Card.create original_text: original, translated_text: translated
end
