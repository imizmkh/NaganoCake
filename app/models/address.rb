class Address < ApplicationRecord

  belongs_to :customer
end

def full_address
  '〒'+ postal_code + ' ' + address + ' ' + name
end