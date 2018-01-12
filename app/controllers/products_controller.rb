class ProductsController < ApplicationController
require "csv"

def index
  @products = Product.paginate(page: params[:page]) 
  end

  def show
    @products = Product.find(params[:id])
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

  end
end