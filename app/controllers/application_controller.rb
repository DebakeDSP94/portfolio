class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  add_flash_types :info, :success, :warning
end