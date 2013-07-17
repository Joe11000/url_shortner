class Url < ActiveRecord::Base
  # Remember to create a migration!

  #before_save :ensure_long_url_is_valid

  def get_shorten!(long_url)
    
    matched_long_url_arr = self.where('long_url = #{url.long_url}')

    if matched_long_url_arr.empty?
      newLongUrl!(long_url)
    else
      oldLongUrl!(long_url)
    end
  end

  private 
  # long url is in the database already 
    def oldLongUrl!(long_url) 
      url = Url.find_by(long_url: long_url)
      url.click_counter += 1      #then increment the click_counter 
      url.short_url               # show the short url that already exists
    end

# the long url doesn't exist in the database model Url
    def newLongUrl!(long_url) 
        
        # create a short url 
        short_url = ""
        'a1'.upto('zzzzz9') do |i|
          # check to see if short url already exists
          if Url.find_by(long_url: "/" + short_url).size == 0
            short_url = "/#{i}"
            break
          end
        end
        puts short_url
        
        self.create
    end
end



        # add new long url and short url and click_counter=1 to database
