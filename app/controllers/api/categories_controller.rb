module Api
    class CategoriesController < ApplicationController

        before_action :set_category,only: %i[update show destroy]
        before_action :authenticate_user!


        def index
            @categories = Category.order(created_at: :desc)
            if !@categories.blank?
              render json: @categories, status: :ok
            else
              render json: @categories, status: :bad_request
            end
          end
      
          def show
            # @category = Category.find(params[:id])
            # @category = set_category
            if !@category.blank?
              render json: @category, status: :ok
            else
              render json: @category, status: :bad_request
            end
          end
      
          def create
            authorize(@category) 
            @category = Category.create(params_category)
            if @category.save
              render json: @category, status: :ok
            else
              render json: "Category kaydedilemedi", status: :bad_request
            end
          end
      
          def update
            # @category = Category.find(params[:id])
            # @category = set_category
            authorize(@category) 
            if @category.update(params_category)
              render json: @category, status: :ok
            else
              render json: "category güncellenemedi", status: :bad_request
            end
          end
      
          def destroy
            # @category = Category.find(params[:id])
            # @category = set_category
            authorize(@category) 
            if @category.destroy
              render json: "Category silindi", status: :ok
            else
              render json: "category silinemedi", status: :bad_request
            end
          end
      
        #   private
          
          def set_category
            @category = Category.find(params[:id])
          end
      
          def params_category
            params.permit(:name)
          end
    end
end
