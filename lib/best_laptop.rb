# require "best_laptop/version"

module BestLaptop
#   class Error < StandardError; end
#   # Your code goes here...
end

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'


require_relative "./best_laptop/scraper"
require_relative "./best_laptop/laptop"
require_relative "./best_laptop/version"
require_relative "./best_laptop/cli"


