# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Dir.glob('db/prefectures/*.html') do |filename|
  html_content = File.open(filename)
  doc = Nokogiri::HTML(html_content)
  doc.search('.entry-content').each do |element|
    post_codes = element.text.scan(/[0-9]{3}-[0-9]{4}/)
    cities = element.text.scan(/of(.+), Japan/)
    post_codes.each_with_index do |post_code, index|
      area = Area.new
      area.city = cities[index].join.strip
      area.post_code = post_code
      area.save!
    end
  end
end
