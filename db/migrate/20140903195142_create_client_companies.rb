class CreateClientCompanies < ActiveRecord::Migration
  def change
    create_table :client_companies, :id => false do |t|
      t.integer :company_id
      t.integer :client_id
    end
  end
end
