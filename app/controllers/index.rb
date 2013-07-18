get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  # create a new Url
  p params
  @shorty = Url.new(params[:url])
  p @shorty
  # @shorty.short_url = @shorty.get_shorten!(@shorty.long_url)
  @shorty.short_url = @shorty.get_shorten!(@shorty.long_url)
  @shorty.save
  # @show = "short"
  @show = 'short'
  erb :show_url
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @show = "long"
  erb :show_url
end
