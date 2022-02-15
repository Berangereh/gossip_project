class ApplicationController < ActionController::Base
  add_flash_types :alert

  include SessionsHelper

end
