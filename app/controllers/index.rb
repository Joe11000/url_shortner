get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  # create a new Url
  p params
  @shorty = Url.create(params[:url])
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end
