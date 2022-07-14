class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render template: "properties/index"
  end

  def show
    @property = Property.find_by(id: params[:id])
    render template: "properties/show"
  end

  def z_basic
    property = Property.find_by(id: params[:id])
    processed_address = ""
    index = 0
    raw = property.address
    while index < raw.length
      if raw[index] == " "
        processed_address += "%20"
      else
        processed_address += raw[index]
      end
      index += 1
    end
    data = HTTP.get("https://api.bridgedataoutput.com/api/v2/pub/parcels?access_token=YOURAPIKEYGOESHERE&address.full=#{processed_address}")
    render json: data.parse(:json)
  end

  def z_assessment
    property = Property.find_by(id: params[:id])
    processed_address = ""
    index = 0
    raw = property.address
    while index < raw.length
      if raw[index] == " "
        processed_address += "%20"
      else
        processed_address += raw[index]
      end
      index += 1
    end
    assessment = HTTP.get("https://api.bridgedataoutput.com/api/v2/zestimates_v2/zestimates?access_token=YOURAPIKEYGOESHERE&address==#{processed_address}")
    render json: assessment.parse(:json)
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
