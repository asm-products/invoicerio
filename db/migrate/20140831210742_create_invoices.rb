class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.references :issued_by_company, index: true
      t.references :issued_to_company, index: true
      t.date :date_of_issue
      t.string :currency
      t.boolean :draft
      t.date :expiration_date

      t.timestamps
    end
  end
end
