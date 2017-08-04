class Admin::BaseController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTHORIZATION_USERNAME"], password: ENV["HTTP_BASIC_AUTHORIZATION_PASSWORD"]

end