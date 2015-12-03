require 'open-uri'
require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts 'Event Manager Initialized'

if File.exist? 'event_attendees.csv' 
  puts 'File found.'
else
  puts 'Downloading file...'
  download = open('http://tutorials.jumpstartlab.com/projects/event_attendees.csv')
  IO.copy_stream(download, 'event_attendees.csv')
end

def verify_zip zip
  zip.to_s.rjust(5,'0')[0..4]
end

def legislators_by_zipcode zip
  Sunlight::Congress::Legislator.by_zipcode(zip)
end

def send_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')
  file = "output/thank_you_#{id}.html"
  File.open(file, 'w') do |file|
    file.puts form_letter
  end
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read '../form_letter.erb'
erb_template = ERB.new template_letter

contents.each do |line|
  id=line[0]
  name=line[:first_name]
  zip=verify_zip(line[:zipcode])
  legislators=legislators_by_zipcode(zip)
  form_letter = erb_template.result(binding)
  send_thank_you_letter(id, form_letter)
end
