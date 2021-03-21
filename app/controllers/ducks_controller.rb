class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    # @duck = Duck.find(params[:id])
    find_duck
  end

  def new
    @duck = Duck.new
  end

  def edit
    find_duck
    # render :edit 

  end


  def update
    # @duck = Duck.find(params[:id])
    find_duck
    @duck.update(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck.id)
    else 
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
      
    end  




    # @duck.update(duck_params)
    # redirect_to duck_path(@duck.id)


  end

  def create
    # @duck = Duck.new
    # @duck.name = params[:name]
    # @duck.description = params[:description]
    # @duck.student.id = params[:student_id]
    # @duck.save
    @duck = Duck.create(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck.id)
    else 
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
      
    end  
    # redirect_to duck_path(@duck.id)

    # @duck.id comes from as: duck
    
  end

  private 
    def duck_params
        params.require(:duck).permit(:name, :description, :student_id)
    end

    def find_duck
      @duck = Duck.find(params[:id])
    end

end
