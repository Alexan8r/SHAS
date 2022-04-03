class DistributionsController < ApplicationController
  before_action :set_distribution, only: %i[edit update destroy]

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
      create_message(@distribution.title, @distribution.body, @distribution.email, @distribution.randomizer, @distribution.time)
      redirect_to distributions_path, notice: 'Рассылка создана.'
    else
      redirect_to distributions_path, notice: 'Ошибка.'
    end
  end

  def update
    if @distribution.update(distribution_params)
      redirect_to distributions_path, notice: 'Рассылка обновлена.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @distribution.destroy
    redirect_to distributions_path, notice: 'Рассылка удалена.'
  end

  private

  def set_distribution
    @distribution = Distribution.find(params[:id])
  end

  def distribution_params
    params.require(:distribution).permit(:title, :body, :time, :randomizer, :email)
  end

  def create_message(title, body, email, randomizer, time)
    if randomizer == 'false'
      time.times do
        Message.create(title: title, body: body, email: email)
      end
    else
      rand(50).times do
        Message.create(title: title, body: body, email: email)
      end
    end
  end

end
