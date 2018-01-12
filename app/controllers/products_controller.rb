class ProductsController < ApplicationController
require "csv"

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
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

  def index
    @product = Product.all 
  end

end
end