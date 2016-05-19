class FrontController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper
  skip_before_action :verify_authenticity_token
end
