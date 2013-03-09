#coding: utf-8
$:.unshift File.dirname(__FILE__)

require 'redmine_client'

Redmine.ticket do
  create ( {
    :subject => 'ETロボコン 春季オープン大会の出欠を連絡する。',
    :description => '3/17に福山で行われるオープン大会の出欠を連絡する。'
  } )
#  delete(88)
end
