class ToursController < ApplicationController
  def index
    @tours = Tour.all
    render template: "tours/index"
  end

  def show
    @tour = Tour.find_by(id: params[:id])
    render template: "tours/show"
  end

  def create
    tour = Tour.new(
      buyer_id: current_user.id,
      seller_id: params[:seller_id],
      time: params[:time],
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
