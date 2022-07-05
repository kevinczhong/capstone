class ToursController < ApplicationController
  def index
    tours = Tour.all
    render json: tours.as_json
  end

  def show
    tour = Tour.find_by(id: params[:id])
    render json: tour.as_json
  end

  def create
    tour = Tour.new(
      buyer_id: params[:buyer_id],
      seller_id: params[:seller_id],
      date: params[:date],
      property_id: params[:property_id],
    )
    tour.save
    render json: tour.as_json
  end

  def destroy
    tour = Tour.find_by(id: params[:id])
    tour.destroy
    render json: { message: "This tour has been unscheduled." }
  end
end
