require "rubygems"
require "mechanize"
require "nokogiri"
require "open-uri"
require "csv"
require 'socksify'

@state = "IL"

  DATA_DIR = "data-hold/therapists"
  Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
  
  BASE_URL = "http://therapists.psychologytoday.com"

  HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}
  
  @url = "http://therapists.psychologytoday.com/rms/state/IL.html"
  @agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
  @html = @agent.get(@url).body
  @page = Nokogiri::HTML(@html)
  
  @agent.idle_timeout = 3
  @agent.retry_change_requests = true
  @agent.keep_alive = false
  
  def open_profiles(page, agent)
    profiles = page.css(".result-name")
    profiles.each do |name|
      profile_hrefs = name.css("a").map{ |a|
        a['href']
      }.compact.uniq
      
      profile_hrefs.each do |href|
        link = "#{BASE_URL}#{href}"
        profile = "#{DATA_DIR}/#{File.basename(href)}.html"
        unless File.exists?(profile)
          puts "Fetching #{link}..."
          begin
            profile_content = agent.get(link)
          rescue Exception=>e
            puts "Error opening profile: #{e}"
            sleep 0.25
          else
            profile_page = Nokogiri::HTML(profile_content.body)
            
            issues = profile_page.css(".profile-spec_zone_2 .cols-2 ul li")
            @issues_list = Array.new
            issues.each do |issue|
              @issues_list.push(issue.text)
            end
            
            insurances = profile_page.css(".profile-finances .cols-2 ul li")
            @insurances_list = Array.new
            insurances.each do |insurance|
              @insurances_list.push(insurance.text)
            end
            
            average_cost = profile_page.css(".profile-finances .cols-1 ul:nth-child(1) li:nth-child(1)")
            cost_strings = average_cost.text.split(" ")
            if cost_strings.empty?
              @average_cost_min = "empty"
              @average_cost_max = "empty"
            elsif (cost_strings.count == 1)
              @average_cost_min = cost_strings[1]
              @average_cost_max = "empty"
            elsif (cost_strings.count == 4)
              @average_cost_min = cost_strings[1]
              @average_cost_max = cost_strings[cost_strings.size - 1]
            elsif (cost_strings.count > 4)
              @average_cost_min = cost_strings[1]
              @average_cost_max = cost_strings[cost_strings.size - (cost_strings.size - 4) - 1]
            else
              @average_cost_min = "empty"
              @average_cost_max = "empty"
            end
            
            if @average_cost_max.length > 5
              @average_cost_string_split = @average_cost_max.split("")
              @average_cost_max = @average_cost_string_split[0..3].join("")
            end
            puts @average_cost_min + "-" + @average_cost_max
            
            sliding_scale_html = profile_page.css(".profile-finances .cols-1 ul:nth-child(1) li+li")
            sliding_scale_strings = sliding_scale_html.text.split(" ")
            if sliding_scale_strings.empty?
              @sliding_scale = "empty"
            else
              @sliding_scale = sliding_scale_strings[2].to_s
            end
            
            if @sliding_scale.length > 3
              sliding_string_split = @sliding_scale.split("")
              if sliding_string_split[0..1].join("") == "No"
                @sliding_scale = sliding_string_split[0..1].join("")
              elsif sliding_string_split[0..1].join("") == "Ye"
                @sliding_scale = sliding_string_split[0..2].join("")
              else
                @sliding_scale = "empty"
              end
            end
            puts "Sliding scale: " + @sliding_scale
            
            accepted_payment_methods = profile_page.css(".section-content .profile-list-comma")
            payment_strings = accepted_payment_methods.text.split(" ")
            if payment_strings.empty?
              @payment_methods = "empty"
            else
              @payment_methods = payment_strings[3..payment_strings.size].join(" ")
            end
            puts "Payment methods: " + @payment_methods
            
            years_practice_html = profile_page.css(".profile-qualifications .cols-1 ul:nth-child(1) li:nth-child(1)")
            years_strings = years_practice_html.text.split(" ")
            if years_strings.empty?
              @years_in_practice = "empty"
            elsif years_strings[0] == "Years"
              @years_in_practice = years_strings[3..(years_strings.count)].join(" ")
            else
              @years_in_practice = "empty"
            end
            puts @years_in_practice
            
            year_grad_html = profile_page.css(".profile-qualifications .section-content .cols-1 ul:nth-child(1) li[5]")
            year_grad_strings = year_grad_html.text.split(" ")
            if year_grad_strings.empty?
              @year_grad = "empty"
            elsif year_grad_strings[0] == "Year"
              @year_grad = year_grad_strings[2]
            else
              @year_grad = "empty"
            end
            puts "Year graduated " + @year_grad
            
            school_html = profile_page.css(".profile-qualifications .section-content .cols-1 ul:nth-child(1) li[3]")
            school_strings = school_html.text.split(" ")
            if school_strings.empty?
              @school_name = "empty"
            elsif school_strings[0] == "School:"
              @school_name = school_strings[1..(school_strings.count - 1)].join(" ")
            else
              @school_name = "empty"
            end
            puts "School: " + @school_name
            
          ensure
            sleep 0.5
          end
          @issues_array.push(@issues_list)
          @insurances_array.push(@insurances_list)
          @average_cost_min_array.push(@average_cost_min)
          @average_cost_max_array.push(@average_cost_max)
          @sliding_scale_array.push(@sliding_scale)
          @payment_methods_array.push(@payment_methods)
          @years_in_practice_array.push(@years_in_practice)
          @year_grad_array.push(@year_grad)
          @school_name_array.push(@school_name)
        end
      end
    end
  end
  
  def get_contact(page, agent)
    names = page.css(".result-name span[itemprop='name']")
    subtitles = page.css(".result-name span[itemprop='jobTitle']")
    phones = page.css(".result-phone")
    cities = page.css("div.result-address span[itemprop='addressLocality']")
    states = page.css("div.result-address span[itemprop='addressRegion']")
    zipcodes = page.css("div.result-address span[itemprop='postalcode']")
    puts("#{names.text}", "#{subtitles.text}", "#{phones.text}", "#{cities.text}", "#{states.text}", "#{zipcodes.text}")
    save_to_csv(names, subtitles, phones, cities, states, zipcodes)
  end
  
  def open_email_form(page, agent)
    phones = page.css("div.result-phone")
    emails = page.css(".result-actions")
    emails.each do |email|
      email_hrefs = email.css("a:nth-child(1)").map{ |a|
        a['href']
      }.compact.uniq
      
      email_hrefs.each do |email_href|
        email_link = "#{BASE_URL}#{email_href}"
        local_fname = "#{DATA_DIR}/#{File.basename(email_href)}.html"
        unless File.exists?(local_fname)
          puts "Fetching email page at #{email_link}..."
          begin
            email_form_page = agent.get(email_link)
          rescue Exception=>e
            puts "Error opening email form page: #{e}"
            sleep 0.25
          else
            email_form = email_form_page.forms.first
            if email_form_page.forms.first.nil?
              email = "empty"
            else
              email_form.field_with(:name => "your_name").value = "Aaron"
              email_form.field_with(:name => "your_email").value = "genejaelee@gmail.com"
              email_form.field_with(:name => "subject").value = "hello"
              email_form.field_with(:name => "body").value = "hello"
              email_error_page = agent.submit(email_form, email_form.buttons.first)
              email_alert_message = email_error_page.search(".alert-error")
              alert_strings = email_alert_message.text.split(" ")
              email = alert_strings[5]
              puts "Posting email form"
            end
          ensure
            sleep 0.25 + rand
          end
          puts(email)
          @email_array.push(email)
        end
      end
    end
    
  end
  
  def save_to_csv(names, subtitles, phones, cities, states, zipcodes)
    if !File.exist?('data-hold/' + @state + '/therapists_in_' + @state + '.csv')
      if !Dir.exist?('data-hold/' + @state)
        Dir.mkdir('data-hold/' + @state)
      end
      CSV.open('data-hold/' + @state + '/therapists_in_' + @state + '.csv', 'wb') do |csv|
        csv << ["Names", "Title", "Phone Number", "City", "State", "Zipcode", "Email", "Issues", "Insurance", "Average Min Cost", "Average Max Cost", "Sliding Scale", "Payment Methods", "Years in Practice", "Year Graduated", "School"]
      end
    end
    CSV.open('data-hold/' + @state + '/therapists_in_' + @state + '.csv', 'a+') do |csv|
      names.each_with_index do |name, index|
        csv << ["#{names[index].text}", 
        "#{if subtitles[index].nil?
          "empty"
        else
          subtitles[index].text
        end}", 
        "#{if phones[index].nil?
          "empty"
        else
          phones[index].text
        end}",  
        "#{if cities[index].nil?
          "empty"
        else
          cities[index].text
        end}",  
        "#{if states[index].nil?
          "empty"
        else
          states[index].text
        end}", 
        "#{if zipcodes[index].nil?
          "empty"
        else
          zipcodes[index].text
        end}", 
        "#{@email_array[index].to_s}",
        "#{@issues_array[index].join(", ")}",
        "#{@insurances_array[index].join(", ")}}",
        "#{@average_cost_min_array[index]}",
        "#{@average_cost_max_array[index]}",
        "#{@sliding_scale_array[index]}",
        "#{@payment_methods_array[index]}",
        "#{@years_in_practice_array[index]}",
        "#{@year_grad_array[index]}",
        "#{@school_name_array[index]}"
        ]
      end
    end
  end

  @indices = Array.new
  i = 1
  while i < 3000
    @indices.push('&rec_next=' + i.to_s)
    i += 20
  end
  @indices.each do |index|
    href = "/rms/prof_results.php?sid=1396502887.6987_20398&state=" + @state + index
    puts href

    @issues_array = Array.new
    @insurances_array = Array.new
    @email_array = Array.new
    @average_cost_min_array = Array.new
    @average_cost_max_array = Array.new
    @sliding_scale_array = Array.new
    @payment_methods_array = Array.new
    @years_in_practice_array = Array.new
    @year_grad_array = Array.new
    @school_name_array = Array.new
    
    link = "#{BASE_URL}#{href}.html"
    @new_page = Nokogiri::HTML(@agent.get(link).body)
    local_fname = "#{DATA_DIR}/" + @state + "/#{File.basename(href)}.html"
    unless Dir.exists?("#{DATA_DIR}/" + @state)
      Dir.mkdir("#{DATA_DIR}/" + @state)
    end
    unless File.exists?(local_fname)
      puts "Fetching #{link}..."
      begin
        listings = @agent.get(link)
      rescue Exception=>e
        puts "Error: #{e}"
        sleep 0.5
      else
        open_profiles(@new_page, @agent)
        open_email_form(@new_page, @agent)
        puts(@email_array)
        get_contact(@new_page, @agent)
        File.open(local_fname, 'w'){|file| file.write(listings)}
        puts "\t...Success, saved to #{local_fname}"
      ensure
        sleep 0.25 + rand
      end
    end
  end