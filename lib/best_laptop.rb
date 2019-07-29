# require "best_laptop/version"

# module BestLaptop
#   class Error < StandardError; end
#   # Your code goes here...
# end


require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./best_laptop/version"
require_relative "./best_laptop/cli"
require_relative "./best_laptop/labtop"
require_relative "./best_laptop/scraper"