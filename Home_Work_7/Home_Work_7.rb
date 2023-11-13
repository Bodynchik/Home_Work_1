require 'nokogiri'
require 'open-uri'
require 'csv'

list = []
doc_path = Nokogiri::HTML(URI.open('https://www.hospitalsafetygrade.org/all-hospitals'))
doc_path.search('section ul a').each do |i|
  list.push(i.text)
end

csv_path = 'Home_Work_7/list_hospital.csv'

CSV.open(csv_path, 'w') do |csv|
  list.each_with_index do |row, num|
    csv << ["#{num + 1}. #{row}"]
  end
end

puts "Файл list_hospital.csv створено або перезаписано!"