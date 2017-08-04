class Admin::DashboardController < Admin::BaseController

  http_basic_authenticate_with name: "Jungle", password: "book"

  def show
  end
end
