class Url < ActiveRecord::Base
  # Remember to create a migration!

  def get_shorten!(long_url)
    matched_long_url_arr = Url.where("long_url = ?", long_url)
    if matched_long_url_arr.empty?
      newLongUrl!(long_url)
    else
      puts "hi"
      oldLongUrl!(matched_long_url_arr.first)
    end
  end

  
  # long url is in the database already 
    def oldLongUrl!(old_url_entry) 
      old_url_entry.click_counter += 1      #then increment the click_counter 
      old_url_entry.short_url               # show the short url that already exists
    end

# the long url doesn't exist in the database model Url
    def newLongUrl!(long_url) 
        # create a short url 
        short_url = ""
        'a1'.upto('zzzzz9') do |index|
          # check to see if short url already exists
          index = '/' + index  

          if Url.where("short_url = ?",  index).size == 0
            short_url = "#{index}"
            break
          end
        end
        short_url
    end
end



        # add new long url and short url and click_counter=1 to database
