class Call < ActiveRecord::Base
  belongs_to :call_status
  belongs_to :order
end
