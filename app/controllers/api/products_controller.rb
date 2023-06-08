module Api
  class ProductsController < ApplicationController

      before_action :set_product,only: %i[update show destroy]
      before_action :authenticate_user!

      def index
          # @products = Product.order(created_at: :desc)
          @products = Product.all
          if !@products.blank?
            render json: @products, status: :ok
          else
            render json: @products, status: :bad_request
          end
        end
    
        def show
          # @product = product.find(params[:id])
          # @product = set_product
          if !@product.blank?
            render json: @product, status: :ok
          else
            render json: @product, status: :bad_request
          end
        end
    
        def create
          @product = Product.create(params_product)
          authorize(@product) 
          if @product.save
            render json: @product, status: :ok
          else
            render json: "product kaydedilemedi", status: :bad_request
          end
        end
    
        def update
          # @product = product.find(params[:id])
          # @product = set_product
          authorize(@product) 
          if @product.update(params_product)
            render json: @product, status: :ok
          else
            render json: "product güncellenemedi", status: :bad_request
          end
        end
    
        def destroy
          # @product = product.find(params[:id])
          # @product = set_product
          authorize(@product) 
          if @product.destroy
            render json: "product silindi", status: :ok
          else
            render json: "product silinemedi", status: :bad_request
          end
        end
    
      #   private
        
        def set_product
          @product = Product.find(params[:id])
        end
    
        def params_product
          params.permit(:name)
        end
  end
end
