class ReviewsController < ApplicationController
  before_filter :only => [:create, :destroy]
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    @review.save
    redirect_to product_path(params[:product_id])
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])

  end

  protected 

  def review_params
    params.require(:reviews).permit(:description, :rating, :id)
  end 
end
