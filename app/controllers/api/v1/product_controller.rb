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
                ActiveRecord::Base.transaction do
                    product = Product.new(product_params)
                    
                    if product.save
                        category_product = CategoryProduct.new({ :product_id => product.id, :category_id => params[:category_id] })
                        product_image = ProductImage.new({ :product_id => product.id, :image_id => params[:image_id] })

                        if category_product.save and product_image.save
                            render json: {status: 'SUCCESS', message: 'Saved product', data: product}, 
                            status: :ok
                        else
                            raise ActiveRecord::Rollback, category_product.errors.full_messages
                            render json: {status: 'ERROR', message: 'Product not saved', data: product.errors}, 
                            status: :unprocessable_entity
                        end
                    else
                        render json: {status: 'ERROR', message: 'Product not saved', data: product.errors}, 
                        status: :unprocessable_entity
                    end
                end
            end

            def update
                ActiveRecord::Base.transaction do
                    product = Product.find(params[:id])

                    if product.update_attributes(product_params)
                        category_product = CategoryProduct.where({ :product_id => product.id }).first
                        category_product.category_id = params[:category_id]

                        product_image = ProductImage.where({ :product_id => product.id }).first
                        product_image.image_id = params[:image_id]

                        if category_product.category_id_changed? or product_image.image_id_changed?
                            render json: {status: 'SUCCESS', message: 'Updated product', data: product}, 
                            status: :ok
                        else
                            raise ActiveRecord::Rollback, category_product.errors.full_messages
                            render json: {status: 'ERROR', message: 'Product not updated', data: product.errors}, 
                            status: :unprocessable_entity
                        end
                    else
                        render json: {status: 'ERROR', message: 'Product not updated', data: product.errors}, 
                        status: :unprocessable_entity
                    end
                end
            end

            def destroy
                product = Product.find(params[:id])
                CategoryProduct.where(product_id: product.id).delete_all
                ProductImage.where(product_id: product.id).delete_all
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