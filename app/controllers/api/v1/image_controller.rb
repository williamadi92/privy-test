module Api
    module V1
        class ImageController < ApplicationController
            def index
                images = Image.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded images', data: images}, 
                status: :ok
            end

            def show
                image = Image.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded image', data: image}, 
                status: :ok
            end

            def create
                image = Image.new(image_params)

                if image.save
                    render json: {status: 'SUCCESS', message: 'Saved image', data: image}, 
                    status: :ok
                else
                    render json: {status: 'ERROR', message: 'Image not saved', data: image.errors}, 
                    status: :unprocessable_entity
                end
            end

            def update
                image = Image.find(params[:id])
                if image.update_attributes(image_params)
                    render json: {status: 'SUCCESS', message: 'Updated image', data: image}, 
                    status: :ok
                else
                    render json: {status: 'ERROR', message: 'Image not updated', data: image.errors}, 
                    status: :unprocessable_entity
                end
            end

            def destroy
                image = Image.find(params[:id])
                ProductImage.where(image_id: image.id).delete_all
                image.destroy
                render json: {status: 'SUCCESS', message: 'Deleted image', data: image}, 
                status: :ok
            end            

            private

            def image_params
                params.permit(:name, :enable, :file)
            end
        end
    end
end