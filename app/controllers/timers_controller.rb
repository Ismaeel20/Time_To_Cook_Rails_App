class TimersController < ApplicationController
  def index
    # @timers = Timer.all
    @timer = Timer.new

    if params[:query].present?
      if params[:query].match(/\d/)
        sql_query = "time = :query"
        @timers = Timer.where(sql_query, query: params[:query].to_f)
      else
      # @timers = Timer.where(sql_query, query: "%#{params[:query]}%")
      # sql_query = "ingredient ILIKE ?"
      sql_query = "ingredient ILIKE :query"
      @timers = Timer.where(sql_query, query: "%#{params[:query]}%")
      end
    else
      @timers = Timer.where(user_id: current_user).or(Timer.where(user_id: nil))
    end
  end

  def edit
    @timer = Timer.find(params[:id])
  end

  # def new
  #   @timer = Timer.new
  # end

  def create
    @timer = Timer.new(timer_params)
    @timer.user_id = current_user.id
    @timer.save
    redirect_to timers_path(@timer)
  end

  def destroy
    @timer = Timer.find(params[:id])
    @timer.destroy
    redirect_to timer_path status: :see_other
  end

  def update
    @timer = Timer.find(params[:id])
    if @timer.update(timer_params)
      redirect_to timers_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end
end

private

def timer_params
  params.require(:timer).permit(:ingredient, :time)
end
