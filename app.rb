require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')
require('pry')
get('/') do
    erb(:index)
end
get('/title') do
    @weight=params.fetch('weight').to_i
    @height=params.fetch('height').to_i
    @width=params.fetch('width').to_i
    @length=params.fetch('length').to_i
    @vol=Parcel.new(@weight, @height, @width, @length).volume()
    @cost=Parcel.new(@weight, @height, @width, @length).cost_to_ship()
    erb(:title)
end
