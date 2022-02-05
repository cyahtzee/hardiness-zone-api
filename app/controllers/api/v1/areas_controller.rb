class Api::V1::AreasController < Api::V1::BaseController
  def index
    @areas = policy_scope(Area)
  end

  def show
    @post_code = params[:query]
    counter = -1
    @area = Area.find_by post_code: @post_code
    if @area.nil?
      until @area.nil? == false
        @area = Area.find_by post_code: @post_code
        @post_code[counter] = "0"
        counter = counter -1
      end
      @area
    end
    authorize @area
  end
end
