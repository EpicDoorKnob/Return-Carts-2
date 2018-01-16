class Product < ApplicationRecord
    belongs_to :cart
    require 'CSV'
    validates :sku, presence: true, uniqueness: true
end
