require 'rubygems'
require 'active_resource'

class Issue < ActiveResource::Base
  self.site = 'http://www.example.com/redmine/'
  self.user = 'user'
  self.password = 'pass'
end
