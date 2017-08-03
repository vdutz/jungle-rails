class Admin::BaseController < ApplicationController

  http_basic_authenticate_with name: "Jungle", password: "book"

end