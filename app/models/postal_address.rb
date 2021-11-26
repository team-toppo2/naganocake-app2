class PostalAddress < ApplicationRecord

  belongs_to :customer

  def full_address
    '〒' + postal_code + ' ' + postal_address + ' ' + postal_name
  end
end
