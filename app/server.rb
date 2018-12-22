require 'sinatra'
require_relative './models/test'

before do
  if request.body.size > 0
    request.body.rewind
    @params = Sinatra::IndifferentHash.new
    @params.merge!(JSON.parse(request.body.read))
  end
end

##################################
# Return a Hello world JSON
##################################
get '/hello-world' do
  content_type :json
  t = Test.new(thing: 'Thing!', params: @params)
  t.to_h.to_json
end

post '/hello-world' do
  content_type :json
  t = Test.new(thing: @params['thing'])
  t.valid?
  t.to_h.to_json
end
