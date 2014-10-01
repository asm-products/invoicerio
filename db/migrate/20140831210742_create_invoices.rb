class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number,                :null => false
      t.references :issued_by_company, :null => false, index: true
      t.references :issued_to_company, :null => false, index: true
      t.date :date_of_issue,           :null => false
      t.string :currency,              :null => false
      t.boolean :draft,                :null => false
      t.date :expiration_date,         :null => false

      t.timestamps
    end
  end
end
