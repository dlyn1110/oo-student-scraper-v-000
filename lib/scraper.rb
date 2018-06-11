require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    #is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array
    # of hashes in which each hash represents one student
    # need to return an array to iterate over to grab the information I want.
    doc = Nokogiri::HTML(open(index_url))
    students_array = []
    

  end

  def self.scrape_profile_page(profile_url)

  end

end
