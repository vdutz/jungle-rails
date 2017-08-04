class ReviewsController < ApplicationController

  before_filter :deny_access, :unless => :user_logged_in?

  def create
    # @review = Review.new(review_params)
    @review = Review.new(product_id: params["product_id"],
                        user_id: current_user.id,
                        description: params["review"]["description"],
                        rating: params["review"]["rating"]
                        )

    if @review.save
      puts "New review succesfully created."
      redirect_to product_path(@review.product), notice: 'Review posted!'
    else
      puts "New review save failed."
      # redirect_to product_path(@review.product), notice: 'Failed to post review'
      @product = @review.product
      @reviews = @product.reviews
      render 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = @review.product
    @review.destroy
    puts "Review succesfully deleted!"
    redirect_to product_path(@product.id), notice: 'Product deleted!'
  end

  protected

  def user_logged_in?
    current_user
  end

  # def review_params
  #   params.require(:review).permit(
  #     :product_id,
  #     :user_id,
  #     :description,
  #     :rating
  #   )
  # end

end
