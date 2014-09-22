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
    puts "#{params[:request]}"
    create_document = tv.create_document(vault_id, params[:request])
    puts "created document"
    @request = Request.create(:document_id => create_document["document_id"])
    
    puts "getting that document"
    get_document = tv.get_document(vault_id, @request.document_id)
    puts "#{get_document}"
    puts "#{@request.document_id}"
  end
end
