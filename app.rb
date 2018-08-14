require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/members_ctrl.rb')
require_relative('controllers/gymclasses_ctrl.rb')
require_relative('controllers/bookings_ctrl.rb')

also_reload('models/*')

get '/' do
  erb(:index)
end
