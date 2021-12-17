class Api::V1::AreasController < Api::V1::BaseController
  def index
    @areas = policy_scope(Area)
  end
end
