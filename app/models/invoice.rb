class Invoice < ActiveRecord::Base
  belongs_to :issued_by_company, :class_name => 'Company', :foreign_key => 'issued_by_company_id'
  belongs_to :issued_to_company, :class_name => 'Company', :foreign_key => 'issued_to_company_id'
end
