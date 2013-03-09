#coding: utf-8
$:.unshift File.dirname(__FILE__)

require 'redmine_client'

Redmine.ticket do
  update ( {
    :id      => 108,
    :subject => 'タイトルを変更します。'
  } )
end
