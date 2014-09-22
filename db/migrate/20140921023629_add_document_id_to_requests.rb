class AddDocumentIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :document_id, :string
  end
end
