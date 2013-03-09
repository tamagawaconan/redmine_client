# coding: utf-8

$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'active_resource'
require 'config'
require 'csv'

class Redmine

  def initialize &block
    begin
      instance_eval &block
    rescue => e
      p e
    end
  end

  def self.ticket &block
    Redmine.new &block
  end

  # show ticket
  def show(id)
    begin
      issue = Issue.find(id)
      puts "project: #{issue.project.id}: #{issue.project.name}"
      puts "Title: #{issue.id}: #{issue.subject}"
      puts "Status: #{issue.status.name}"
      puts "Author: #{issue.author.name}"
      print "Description:"
      puts issue.description
    rescue => e
      puts 'ticket-id not found.'
      p e.message
    end
  end

  # update ticket
  def update(params)
    begin
      issue = Issue.find(params[:id])
      issue.subject = params[:subject]
      issue.save
    rescue
      puts 'ticket-id not found.'
      p e.message
    end
  end

  # create ticket
  def create(params)
    issue = Issue.new(
      :tracker_name => "Feature",
      :subject => params[:subject],
      :assigned_to_id => 3,
      :project_id => 2,
      :description => params[:description],
    )
    if issue.save
      puts issue.id
    else
      puts issue.errors.full_messages
    end
    return issue.id
  end

  # delete ticket
  def delete(id)
    begin
      issue = Issue.find(id)
      issue.destroy
    rescue
      puts 'ticket-id not found.'
      p e.message
    end
  end

  def csv_create(path)
    CSV.open(path, "r") do |csv|
      csv.each do |row|
        subject = row[0]
        description = row[1]

        issue = Issue.new(
          :tracker_name => "Feature",
          :subject => subject,
          :assigned_to_id => 3,
          :project_id => 2,
          :description => description,
        )
        if issue.save
          puts issue.id
        else
          puts issue.errors.full_messages
        end
      end
    end
  end
end
