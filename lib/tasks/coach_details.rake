desc "Get coach details"
task :get_coach_details => :environment do
    
  require "nokogiri"
  require "open-uri"
  require 'active_record'
  
  for i in 1..12
    domain = "http://www.associationforcoaching.com"
    #p "http://www.associationforcoaching.com/member_search/ind/accredited/All/?page="+i.to_s
    url = "http://www.associationforcoaching.com/member_search/ind/accredited/All/?page="+i.to_s
    doc = Nokogiri::HTML(open(url))
    for xxx in 1..20     

       @name = doc.xpath('html/body/div[2]/div/div/div[3]/div[2]/div/div[3]/ul/li['+xxx.to_s+']/a').text
       _href = doc.xpath("html/body/div[2]/div/div/div[3]/div[2]/div/div[3]/ul/li["+xxx.to_s+"]//a").map { |link| link['href'] }

       puts profile_page = domain+_href[0].to_s
       #puts profile_page

       doc1 = Nokogiri::HTML(open(profile_page))
       #_company_name = doc1.xpath("//tr[2]/td").text
       _is_email = doc1.xpath("//tr[3]/th").text
       _email = doc1.xpath("//tr[3]/td").text
       _is_phone_number = doc1.xpath("//tr[4]/th").text
       _phone_number = doc1.xpath("//tr[4]/td").text
       _is_website = doc1.xpath("//tr[5]/th").text
       _website = doc1.xpath("//tr[5]/td").text

       #puts "Company Name: "+_company_name
       #p CoachDetail
       puts "Name: "+@name       
       puts "Email: "+@email = _email if _is_email == "Email:Level:"
       puts "Phone: "+@phone = _phone_number if _is_phone_number == "Tel:"
       puts "Website: "+@website = _website if _is_website == "Website:"
       #puts "Phone Number: "+_phone_number
       #puts "web site: "+_website
       CoachDetail.create!({:name => @name, :email => @email, :phone => @phone, :website => @website })
       @name = nil
       @email = nil
       @phone = nil
       @website = nil
    end
  end   
end