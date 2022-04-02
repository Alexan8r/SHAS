class DistributionsController < ApplicationController
  before_action :set_distribution, only: %i[show edit update destroy]

  def index
    @distributions = Distribution.all
  end

  def new
    @distribution = Distribution.new
  end

  def edit; end

  def create
    @distribution = Distribution.new(distribution_params)
    if @distribution.save
      redirect_to distributions_path, notice: 'Distribution was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @distribution.update(distribution_params)
      redirect_to distributions_path, notice: 'Distribution was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @distribution.destroy
    redirect_to distributions_path, notice: 'Distribution was successfully destroyed.'
  end

  private

  def set_distribution
    @distribution = Distribution.find(params[:id])
  end

  def distribution_params
    params.require(:distribution).permit(:title, :body, :time, :randomizer)
  end
end
