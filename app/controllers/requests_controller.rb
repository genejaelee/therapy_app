class RequestsController < ApplicationController
  require_relative '../../lib/truevault.rb'
  
  def new
    @request = Request.new
  end
  
  def create
  end
  
  def index
  end
  
  def post
    vault_id = ENV['TV_A_VAULT_ID']
    tv = TrueVault::Client.new(ENV['TV_API_KEY'], ENV['TV_ACCOUNT_ID'], 'v1')
    create_document = tv.create_document(vault_id, {"test" => "test"})
    puts "created document"
  end
end
