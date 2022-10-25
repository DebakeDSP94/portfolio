class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[ show edit update destroy move ]
  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :move] }, admin: :all, testing: { except: [:destroy, :create, :update]}
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.by_position
  end

  def new
    @portfolio_item = Portfolio.new
    @portfolio_item.technologies.build
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, success: 'Portfolio item was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, success: 'Portfolio item was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    # Destroy the record
    @portfolio_item.destroy

    # Redirect
    #redirect_to portfolios_path, status: :see_other
    respond_to do |format|
      format.html { redirect_to portfolios_url, status: :see_other }
    end
  end

  def move
    @portfolio_item.insert_at(params[:position].to_i)
  end

  private

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :position,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end
end
