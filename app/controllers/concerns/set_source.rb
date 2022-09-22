module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session.delete 'init'
    session[:source] = params[:q] if params[:q]
  end
end