class ReviewsController < ApplicationController

  before_filter :only => [:show]

  def create
    product = Product.find(params[:product_id])
    review = product.reviews.new(review_params)
    review.user_id = current_user.id
    review.save
    redirect_to product_path(product.id)
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to product_path(params[:product_id])
  end

  private

    def review_params
      params.require(:review).permit(:description, :rating)
    end

end
