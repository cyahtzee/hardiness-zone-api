class Api::V1::AreasController < Api::V1::BaseController
  def index
    @areas = policy_scope(Area)
  end

  def show
    @post_code = params[:query]
    @area = Area.find_by post_code: @post_code
    # need a route if it doesn't find the post_code, maybe target the
    # first 3 numbers and return all the available? for Tokyo it's very
    # broad, some of them have 4 numbers so get that first, otherwise the
    # first 3
    authorize @area
  end
end
