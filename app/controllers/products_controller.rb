class ProductsController < ApplicationController
require "csv"

def cart
  @last = Product.last
end

def index
  @products = Product.all
end

 def show
        @id = Product.find params[:id]
    end

  def new
    @products = Product.new
  end

  def create
    file = params[:file] 
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row| 	
      if Product.exists?(sku: row[:sku])
      Product.find_by(sku: row[:sku]).update_attribute(:upc, row[:upc])
        else
      Product.create!(row.to_h)
      end
  end
      redirect_to products_path
  end
end