class ReviewsController < ApplicationController
    def create
        # find request to review
        @request = Request.find(params[:request_id])
        @review = Review.new(review_params)
        @review.request = @request
        authorize @review
    end

    private

    def review_params
        params.require(:review).permit(:content)
    end
end
