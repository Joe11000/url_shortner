get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  # create a new Url
  p params
  @shorty = Url.new(long_url: params[:url])
  @shorty.short_url = Url.get_shorten!(@shorty.long_url)
  @shorty.save

  erb :show_url
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  erb :show_url
end
