class Url < ActiveRecord::Base
  # Remember to create a migration!

  before_save do |url|
    # if long url is in the database already 
        #then increment the click_counter 
        # show the short url that already exists
     # else the long url doesn't exist in the database model Url
        # create a short url 
        # check to see if short url already exists

        # create a short url

        # while short exists
            # create another short url
        # end
end



        # add new long url and short url and click_counter=1 to database
