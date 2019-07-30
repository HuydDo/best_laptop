class BestLaptop::Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
  end
  
  def self.get_laptops
    self.get_page.css("#roundup-container .roundup-list-container .roundup-item-row")
  end
  
  def self.scrape_laptops
    laptops = []
    
    self.get_laptops.each do |item|
      laptop = {}
      laptop[:name] = item.css("h3").text.strip
      laptop[:price] = item.css(".msrp").text.gsub("MSRP: ","").strip
      laptop[:description] =  item.css(".pros-cons").text.gsub("Bottom Line: ","").strip
      laptop[:url] = item.css("a").last["href"]
      laptops << laptop
    end
    laptops
  end
  
  def self.scrape_laptop_page(laptop_url)
    doc = Nokogiri::HTML (open(laptop_url))
    detail = {}
    
    doc.css(".pros-cons-bl").each do |item|
      detail[:pros] = item.css("li p")[0].text.strip
      detail[:cons] = item.css("li p")[1].text.strip
      detail[:bottom_line] = item.css("li p")[2].text.strip
    end
    
    detail
  end
  
  def print_laptops
    self.scrape_laptop_page
    
    Laptop.all.each do |item|
     puts "Pros: #{item.pros} "
     puts "Cons: #{item.cons} "
     puts "Bottom Line: #{item.bottom_line} "
    end
  end
  
end



  
