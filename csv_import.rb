#coding: utf-8
$:.unshift File.dirname(__FILE__)

require 'redmine_client'

Redmine.ticket do
  csv_create "./ticket.csv"
end
