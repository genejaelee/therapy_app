require "rubygems"
require "mechanize"
require "nokogiri"
require "open-uri"

DATA_DIR = "data-hold/therapists"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

url = http://therapists.psychologytoday.com/rms/county/CA/Los+Angeles.html
BASE_URL = "http://therapists.psychologytoday.com"

HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }

html = agent.get(url).body

page = Nokogiri::HTML(html)

indices = page.css(".endresults-right")
indices.each do |index|
  hrefs = index.css("a").map{ |a| 
    a['href']
  }.compact.uniq
  
  hrefs.each do |href|
    link = "#{BASE_URL}#{href}"
    local_fname = "#{DATA_DIR}/#{File.basename(href)}.html"
    unless File.exists?(local_fname)
      puts "Fetching #{link}..."
      begin
        therapist_content = open(link, HEADERS_HASH).read
      rescue Exception=>e
        puts "Error: #{e}"
        sleep 1
      else
        File.open(local_fname, 'w'){|file| file.write(therapist_content)}
        puts "\t...Success, saved to #{local_fname}"
      ensure
        sleep 1.0 + rand
      end
    end
    
    page = Nokogiri::HTML(open(local_fname))
    names = page.css("div.result-name")
    phone = page.css("div.result-phone")
    names.each_with_index { |name, index| puts "#{name.text}\t\t#{phone[index].text}" }
  end
end