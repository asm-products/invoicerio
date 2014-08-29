class Company < ActiveRecord::Base
  has_one :user, inverse_of: :company
end
