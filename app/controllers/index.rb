
get '/' do
   # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  p params
   @url_arr = Url.where(params[:long_url])

  if @url_arr.size > 0              # if there are no errors
    redirect to("/urls/#{@url_arr.first.id}")
  else
    # if there is a single error about uniqueness in the long_url
     
      @url = Url.create(params[:long_url])   # find url object in the database where long_url has already been entered
      erb :show_url
  end
end

get '/urls/:id' do
  @url = Url.find(params[:id])
  erb :show_url
end


# User used short link
get '/clicked/:short_url' do
  puts "This is the SHORT URL : \"#{param[:short_url]}\" "
   #@url.update(click_counter: @url.click_counter + 1)
   @url = Url.find(params[:short_url])
   puts "\nClick Counter is now #{@url.click_counter.to_i}"
   @url.update(click_counter: (@url.click_counter.to_i+ 1))
   puts "Click Counter is now #{@url.click_counter.to_i}"
   @url.save
end


# # e.g., /q6bda
# get '/clicked/:clicked' do
#    Url.where("short_url = ?", params[:clicked])
#   # redirect to appropriate "long" URL
#   @show = "long"
#   erb :show_url
# end


# # e.g., /q6bda
# get '/:short_url' do
#   # redirect to appropriate "long" URL
#   @show = "long"
#   erb :show_url
# end


