# require_relative './laptop.rb'
# require 'nokogiri'
# require 'open-uri'

class BestLaptop::Scraper
# class Scraper
  
  def initialize(url = nil)
    @url = url
  end


  # doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
  
  # puts (doc)
    # laptops = doc.css("#roundup-container .roundup-list-container .roundup-item-row h3").first.text.strip
  # p doc.css("#roundup-container .roundup-list-container .roundup-item-row h3")[0].attributes
  # msrps = doc.css("#roundup-container .roundup-list-container .roundup-item-row .msrp")
  
  # msrps.each do |msrp|
  #   puts msrp.text.strip
  # end
  
  
  # laptops = doc.css("#roundup-container .roundup-list-container .roundup-item-row")
 
  # laptops.each do |laptop|
  #   puts laptop.css("h3").text.strip
  #   puts laptop.css(".msrp").text.strip
  # end
    
  def self.get_page
    doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
  end
  
  def self.get_laptops
    self.get_page.css("#roundup-container .roundup-list-container .roundup-item-row")
  end
  
  def self.scrape_laptops
    laptops = []
    
    self.get_laptops.each do |item|
       
      # laptop = Laptop.new
      # laptop.name = item.css("h3").text.strip
      # laptop.price = item.css(".msrp").text.strip
      # laptop.description =  item.css(".pros-cons").text.gsub("Bottom Line: ","").strip
      # laptop.url = item.css("a").attribute("href").value
      
      
      laptop = {}
      laptop[:name] = item.css("h3").text.strip
      laptop[:price] = item.css(".msrp").text.strip
      laptop[:description] =  item.css(".pros-cons").text.gsub("Bottom Line: ","").strip
      laptop[:url] = item.css("a").last["href"]
      laptops << laptop
    end
    laptops
  end
  
  def self.scrape_laptop_page(laptop_url)
    doc = Nokogiri::HTML (open(laptop_url))
 
  # def scrape_laptop_page
  #   doc = Nokogiri::HTML(open("https://www.pcmag.com/review/365771/dell-xps-13-9380"))
    
    
    detail = {}
    
    doc.css(".pros-cons-bl").each do |item|
      
      # detail = Laptop.new
      # detail.pros = item.css("li p")[0].text.strip
      # puts detail.pros
      # detail.cons = item.css("li p")[1].text.strip
      # puts detail.cons
      # detail.bottom_line =  item.css("li p")[2].text.strip
      # puts detail.bottom_line
      
      
      detail[:pros] = item.css("li p")[0].text.strip
      detail[:cons] = item.css("li p")[1].text.strip
      detail[:bottom_line] = item.css("li p")[2].text.strip
      
    end
    detail
  end
  
  # def print_laptops
  #   self.scrape_laptops
  #   Laptop.all.each do |item|
  #     if item.name
  #       puts "Name: #{item.name}"
  #       puts "  #{item.price}"
  #       puts "  Description: #{item.description}"
  #       puts "  Read Review: #{item.url}"
  #     end
  #   end
  # end
  
  def print_laptops
    self.scrape_laptop_page
    Laptop.all.each do |item|
       puts "Pros: #{item.pros} "
       puts "Cons: #{item.cons} "
       puts "Bottom Line: #{item.bottom_line} "
    end
  end
  
end

# Scraper.new.print_laptops


  
