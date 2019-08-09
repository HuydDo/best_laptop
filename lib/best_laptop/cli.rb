class BestLaptop::CLI

  def run 
    make_laptops
    list_laptops
    menu
  end
  
  def make_laptops
    laptops_arr = BestLaptop::Scraper.scrape_laptops
    BestLaptop::Laptop.create(laptops_arr)
  end
  
  def list_laptops
    puts "The Best Laptops for 2019.\n".colorize(:yellow)
    @list = BestLaptop::Laptop.all
    @list.each.with_index(1) do |laptop, i|
      puts "#{i}. #{laptop.name}"
    end
    puts
  end
  
  def add_laptop_detail(url,index)
    laptop = BestLaptop::Laptop.all[index]
    laptop_info = BestLaptop::Scraper.scrape_laptop_page(url)
    laptop.add_laptop_info(laptop_info)
  end
  
  def menu
    input = nil
    
    while input != 'exit'
      puts "Enter the number of the laptop for more information.\nType 'show' to display the list. Type 'exit' to quit."
      input = gets.strip.downcase
      if input.to_i > 0 and input.to_i <= @list.size
        laptop = @list[input.to_i - 1]
        puts
        puts "Name:".colorize(:light_blue) + " #{laptop.name}"
        puts "MSRP:".colorize(:light_blue) + " #{laptop.price}"
        puts "Review:".colorize(:light_blue) + " #{laptop.description}"
        puts
        puts "Would you like to read more? Enter Y or N"
        answer = gets.strip.downcase
        if ["y", "yes"].include?(answer.downcase)
          add_laptop_detail(laptop.url,input.to_i - 1)
          puts
          puts "Pros:".colorize(:light_green) + " #{laptop.pros}"
          puts "Cons:".colorize(:light_red) + " #{laptop.cons}"
          puts "Bottom Line:".colorize(:light_blue) + " #{laptop.bottom_line}"
          puts
        elsif ["n", "no"].include?(answer.downcase) 
          break
        else 
          puts "Please check your input."
        end
      elsif input == "show"
        list_laptops
      elsif input == "exit"
        break
      else 
        puts "Please check your input."
      end
    end
    puts "Have a nice day!"
  end
  
end