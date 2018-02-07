class Product < ApplicationRecord
    require 'CSV'
    validates :sku, presence: true, uniqueness: true
    has_many :totes
end
