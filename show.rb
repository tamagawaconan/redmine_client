#coding: utf-8
$:.unshift File.dirname(__FILE__)

require 'redmine_client'

Redmine.ticket do
  show 107
end
