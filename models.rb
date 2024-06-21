require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection

class Medicine < ActiveRecord::Base
end
