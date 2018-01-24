class Product < ApplicationRecord
    require 'CSV'
    validates :sku, presence: true, uniqueness: true
end
