require 'nokogiri'

filepath = "db/prefectures/tokyo.html"
html_content = File.open(filepath)
doc = Nokogiri::HTML(html_content)
doc.search('#post-body-1523308068074273552').each do |element|
  puts element.text.scan(/[0-9]{3}-[0-9]{4}/)
end

# add .count at the end to make sure you are getting all the results,
# would have to check by hand using the website...
