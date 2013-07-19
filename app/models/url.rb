require 'securerandom'

class Url < ActiveRecord::Base
  # Remember to create a migration!
 # validates :short_url, uniqueness: true

 # before_save :get_shorten!
  validates :long_url, :short_url, uniqueness: true
  validates :long_url, :short_url, presence: true
  validates :long_url, format: { with: URI.regexp(['http', 'https']) }
  before_validation :set_short_url!

  def set_short_url!
    short = '/' + SecureRandom.hex(3).to_s
    puts "\n\n\n#{short}\n\n\n"

    # if Url.where(short_url: short).any?
    if Url.where("short_url = ?", short).any?
      set_short_url!
    else
      puts "\n\n\nBEFORE\n\n\n"
      self.short_url = short
      puts "\n\n\nAFTER\n\n\n"
    end
  end

  # def given_long_url(long_url)

  #   matched_long_url_arr = Url.where("long_url = ?", params[:url])

  #   if matched_long_url_arr.size == 0
  #       matched_long_url =  Url.new(params[:url])                           # Instantiate a new URL instance with the long_url 
  #       matched_long_url.short_url  = matched_long_url.get_shorten!(long_url)             # Put newly created unique shortened URL into the database 
  #       # matched_long_url counter is default to click size 0
  #   else
  #       # increment the click counter of the link that already exists in the database
  #       matched_long_url_arr[0].update(click_counter: matched_long_url_arr + 1)
  #   end
  # end


  # def get_shorten(long_url)
  #   matched_long_url_arr = Url.where("long_url = ?", long_url)
  #   if matched_long_url_arr.empty?
  #     newLongUrl!(long_url)
  #   else
  #     matched_long_url_arr.short_url
  #   end
  # end

end
