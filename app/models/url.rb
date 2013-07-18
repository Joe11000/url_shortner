class Url < ActiveRecord::Base
  # Remember to create a migration!

  #before_save :ensure_long_url_is_valid

  def get_shorten!(long_url)
    puts "pie"
    p long_url 
    matched_long_url_arr = Url.where("long_url = ?", long_url)
    p matched_long_url_arr 
    if matched_long_url_arr.empty?
      newLongUrl!(long_url)
    else
      oldLongUrl!(long_url)
    end
  end

  
  # long url is in the database already 
    def oldLongUrl!(long_url) 
      puts "OldLong" 
      url = Url.find_by("long_url = ?", long_url)
      url.click_counter += 1      #then increment the click_counter 
      url.short_url               # show the short url that already exists
    end

# the long url doesn't exist in the database model Url
    def newLongUrl!(long_url) 
        puts "NewLong" 
        # create a short url 
        short_url = ""
        'a1'.upto('zzzzz9') do |i|
          # check to see if short url already exists
          i = '/' + i  
          Url.where("long_url = ?",  i)
          if Url.where("long_url = ?",  i).size == 0
            short_url = "#{i}"
            break
          end
        end
        short_url
    end
end



        # add new long url and short url and click_counter=1 to database
