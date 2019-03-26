module Api
    module V1
        class ProductController < ApplicationController
            def index
                products = Product.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded products', data: products}, 
                status: :ok
            end

            def show
                product = Product.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded product', data: product}, 
                status: :ok
            end

            def create
                product = Product.new(product_params)

                if product.save
                    render json: {status: 'SUCCESS', message: 'Saved product', data: product}, 
                    status: :ok
                else
                    render json: {status: 'ERROR', message: 'Product not saved', data: product.errors}, 
                    status: :unprocessable_entity
                end
            end

            def update
                product = Product.find(params[:id])
                if product.update_attributes(product_params)
                    render json: {status: 'SUCCESS', message: 'Updated product', data: product}, 
                    status: :ok
                else
                    render json: {status: 'ERROR', message: 'Product not updated', data: product.errors}, 
                    status: :unprocessable_entity
                end
            end

            def destroy
                product = Product.find(params[:id])
                product.destroy
                render json: {status: 'SUCCESS', message: 'Deleted product', data: product}, 
                status: :ok
            end            

            private

            def product_params
                params.permit(:name, :description, :enable)
            end
        end
    end
end