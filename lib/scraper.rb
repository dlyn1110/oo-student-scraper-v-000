require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    #is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array
    # of hashes in which each hash represents one student
    # need to return an array to iterate over to grab the information I want.
    doc = Nokogiri::HTML(open(index_url))
    students = []
    doc.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        student_location = student.css('.student-location').text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile = {}
    page = Nokogiri::HTML(open(index_url))
    links = page.css(".social-icon-container").children.css("a").map { |el| el.attribute('href').value}
    links.each do |link|
      if link.include?("linkedin")
        profile[:linkedin] = link
      elsif link.include?("github")
        profile[:github] = link
      elsif link.include?("twitter")
        profile[:twitter] = link
      else
        profile[:blog] = link
     end
   end
   profile[:profile_quote]  page.css(".vitals-text-container div.profile-quote").text
   profile[:bio] = page.css(".details-container .description-holder p").text
   profile
   end
 end
