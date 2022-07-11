class ImagesController < ApplicationController
  def index
    images = Image.all
    render json: images.as_json
  end

  def show
    image = Image.find_by(id: params[:id])
    render json: image.as_json
  end

  def create
    image = Image.create!(
      property_id: params[:property_id],
      image_url: params[:image_url],
    )
    render json: image.as_json
  end

  def update
    image = Image.update(
      property_id: params[:property_id],
      image_url: params[:image_url],
    )
    image.save
    render json: image.as_json
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy
    render json: { message: "This image has been removed." }
  end
end
