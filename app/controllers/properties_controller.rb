class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render template: "properties/index"
  end

  def show
    @property = Property.find_by(id: params[:id])
    render template: "properties/show"
  end

  def create
    property = Property.new(
      user_id: current_user.id,
      floor_space: params[:floor_space],
      bedrooms: params[:bedrooms],
      bathrooms: params[:bathrooms],
      balconies: params[:balconies],
      description: params[:description],
      address: params[:address],
      floors: params[:floors],
      year_built: params[:year_built],
      is_rent: params[:is_rent],
      listed_price: params[:listed_price],
      rent: params[:rent],
      lease_type: params[:lease_type],
      pet_friendly: params[:pet_friendly],
    )
    if property.save
      @property = property
      render template: "properties/show"
    else
      render json: { error_message: property.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    property = Property.find_by(id: params[:id])
    property.update(
      floor_space: params[:floor_space] || property.floor_space,
      bedrooms: params[:bedrooms] || property.bedrooms,
      bathrooms: params[:bathrooms] || property.bathrooms,
      balconies: params[:balconies] || property.balconies,
      description: params[:description] || property.description,
      address: params[:address] || property.address,
      floors: params[:floors] || property.floors,
      year_built: params[:year_built] || property.year_built,
      is_rent: params[:is_rent] || property.is_rent,
      listed_price: params[:listed_price] || property.listed_price,
      rent: params[:rent] || property.rent,
      lease_type: params[:lease_type] || property.lease_type,
      pet_friendly: params[:pet_friendly] || property.pet_friendly,
    )
    if property.save
      @property = property
      render template: "properties/show"
    else
      render json: { error_message: property.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    property = Property.find_by(id: params[:id])
    property.destroy
    render json: { message: "This listing has been removed." }
  end
end
