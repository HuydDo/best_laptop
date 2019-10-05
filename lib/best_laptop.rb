# require "best_laptop/version"

module BestLaptop
#   class Error < StandardError; end
#   # Your code goes here...
end

require 'pry'
require 'nokogiri', '>= 1.10.4'
require 'open-uri'
require 'colorize'
# gem "nokogiri", ">= 1.10.4"
require_relative "./best_laptop/scraper"
require_relative "./best_laptop/laptop"
require_relative "./best_laptop/version"
require_relative "./best_laptop/cli"


