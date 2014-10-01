class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name,     :null => false
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :logo_link

      t.timestamps
    end
  end
end
