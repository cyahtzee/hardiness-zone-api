require 'nokogiri'

# the following is the method to iterate through a single file(change "tokyo")
# for the needed prefecture

# filepath = "db/prefectures/tokyo.html"
# html_content = File.open(filepath)
# doc = Nokogiri::HTML(html_content)
# doc.search('.entry-content').each do |element|
#   puts element.text.scan(/[0-9]{3}-[0-9]{4}/)
# end

# add .count at the end to make sure you are getting all the results,
# would have to check by hand using the website...

# the following is the method to iterate through all the files, the first
# line will be the prefecture name(using regex to pick just the name from the
# file name))

# Dir.glob('db/prefectures/*.html') do |filename|
#   html_content = File.open(filename)
#   doc = Nokogiri::HTML(html_content)
#   doc.search('.entry-content').each do |element|
#     puts filename.match(/(\w+)\./).to_a[0].capitalize[0..-2]
#     puts element.text.scan(/[0-9]{3}-[0-9]{4}/)
#   end
# end

Dir.glob('db/prefectures/*.html') do |filename|
  html_content = File.open(filename)
  doc = Nokogiri::HTML(html_content)
  doc.search('.entry-content').each do |element|
    # puts filename.match(/(\w+)\./).to_a[0].capitalize[0..-2]
    puts element.text.scan(/of(.+), Japan/)
    puts element.text.scan(/[0-9]{3}-[0-9]{4}/)
  end
end
