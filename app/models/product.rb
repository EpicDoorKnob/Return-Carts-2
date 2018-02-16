class Product < ApplicationRecord
    require 'csv'
    validates :sku, presence: true, uniqueness: true
    has_many :totes
end
