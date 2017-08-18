class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new

    Ingredient.all.each do |ingredient|
      @ingredient = @recipe.ingredients.build(name: ingredient.name)
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])

  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

end
