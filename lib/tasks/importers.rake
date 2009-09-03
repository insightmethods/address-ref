# require 'rubygems'
# require 'active_record'
# require 'highline'
# 
# class Company < ActiveRecord::Base
#   
# end
# 
# class Buyer < Company
#   
# end
# 
# class Supplier < Company
#   
# end
# 
# class Agent < Company
#   
# end
# 
# Company.establish_connection(
#     :adapter  => "mysql",
#     :host     => "localhost",
#     :username => "root",
#     :password => "",
#     :database => ""
# )
# 
# namespace :importer do
#   desc "Import Database Entries From Legacy DB"
#   task :companies => :environment do
#     onconsole = HighLine.new
#     Company.find(:all).each do |company|
#       contact = Contact.create
#       contact.company_name    = company.name
#       contact.is_company      = true
#       contact.phone_main      = company.phone_no
#       contact.phone_fax       = company.fax_no
#       contact.email_main      = company.email
#       contact.address_country = company.country
#       
#       puts "#{contact.company_name} #{contact.phone_main} #{contact.phone_fax} #{contact.email_main} #{contact.address_country}"
#       puts 
#       puts '----------------------------------------------'
#       puts
# 
#       contact.save
#     end
#   end
# end