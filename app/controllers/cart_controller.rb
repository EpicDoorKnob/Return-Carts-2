class CartController < ApplicationController

    def index
        @test = params[:test]
    end
    
    def show
        @id = params[:id]
        @test = params[:test]
    end

    def create
        redirect_to action: :index
        end
end
