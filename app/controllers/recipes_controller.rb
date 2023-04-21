class RecipesController < ApplicationController
  before_action :recipe_params, only: :create
  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(**recipe_params)
    if @recipe.save
      redirect_to user_recipes_path, notice: 'recipe was successfully created'
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy!
    redirect_to user_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public, :user_id)
  end
end
