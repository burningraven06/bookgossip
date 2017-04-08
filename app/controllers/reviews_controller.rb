class ReviewsController < ApplicationController
	before_action :require_login
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	# GET /reviews
	# GET /reviews.json
	def index
		params[:search] ? @reviews=Review.search(params[:search]) : @reviews= Review.where("user_id = ?", current_user.id)
		@reviews = @reviews.order(:heading).paginate(page: params[:page], per_page: 18)
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @reviews }
			format.js
		end 
	end

	# GET /reviews/1
	# GET /reviews/1.json
	def show
		@review = Review.find(params[:id])
		respond_to do |format|
			format.html {}
			format.json {}
			format.js
		end
	end

	# GET /reviews/new
	def new
		@review = Review.new
	end

	def new_js
		@book = Book.find(params[:id])
		@review = Review.new
		respond_to do |format|
			format.html{}
			format.json{}
			format.js
		end
	end

	# GET /reviews/1/edit
	def edit
	end

	# POST /reviews
	# POST /reviews.json
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		respond_to do |format|
			if @review.save
				@reviews = Review.order(:heading).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @review; flash[:success]= 'review was successfully created.' }
				format.json { render :show, status: :created, location: @review }
				format.js
			else
				format.html { render :new }
				format.json { render json: @review.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	def create_js
		@book = Book.find(params[:id])
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.book_id = @book.id
		respond_to do |format|
			if @review.save
				@reviews_of_book = @book.reviews.order(heading: :asc).paginate(page: params[:review_page], per_page: 12)
				format.html { redirect_to @review; flash[:success]= 'review was successfully created.' }
				format.json { render :show, status: :created, location: @review }
				format.js
			else
				format.html { render :new }
				format.json { render json: @review.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end



	# PATCH/PUT /reviews/1
	# PATCH/PUT /reviews/1.json
	def update
		@set_def_avt=params[:review][:default_avatar]
		@review.cover_page.destroy if @set_def_avt

		respond_to do |format|
			if @review.update(review_params)
				@reviews = Review.order(:heading).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @review; flash[:info]= 'review was successfully updated.' }
				format.json { render :show, status: :ok, location: @review }
				format.js
			else
				format.html { render :edit }
				format.json { render json: @review.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# DELETE /reviews/1
	# DELETE /reviews/1.json
	def destroy
		@review.destroy
		respond_to do |format|
			format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
			format.json { head :no_content }
			format.js
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_review
		@review = Review.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def review_params
		params.require(:review).permit(:heading, :review, :book_id, :user_id, :status, :cover_page)
	end


end
