class ClientCompany < ActiveRecord::Base
    belongs_to :company, :class_name => 'Company', :foreign_key => 'company_id'
    belongs_to :client,  :class_name => 'Company', :foreign_key => 'client_id'
end
