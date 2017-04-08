class BooksController < ApplicationController
	before_action :require_login
	before_action :set_book, only: [:show, :edit, :update, :destroy]

	# GET /books
	# GET /books.json
	def index
		params[:search] ? @books=Book.search(params[:search]) : @books=Book.where("user_id = ?", current_user.id).order("title")
		@books = @books.paginate(page: params[:page], per_page: 16) if @books
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books}
      format.js
  end
end

	# GET /books/1
	# GET /books/1.json
	def show
		@book=Book.find(params[:id])
		@review=Review.new
		@reviews_of_book = @book.reviews.order(heading: :asc).paginate(page: params[:review_page], per_page: 8)
		@genres_of_book = @book.genres.order(name: :asc).paginate(page: params[:genre_page], per_page:8)
		respond_to do |format|
			format.html {}
			format.json {}
			format.js
		end
	end

	# GET /books/new
	def new
		@book = Book.new
	end

	# GET /books/1/edit
	def edit
	end
	# POST /books
	# POST /books.json
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id

		respond_to do |format|
			if @book.save 
				@books = Book.where("user_id = ?", current_user.id).order("title")
				@books =@books.paginate(page: params[:page], per_page: 16)
				format.html { redirect_to @book; flash[:success] = 'Book was successfully created.' }
				format.json { render :show, status: :created, location: @book }
				format.js
			else
				format.html { render :new }
				format.json { render json: @book.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# PATCH/PUT /books/1
	# PATCH/PUT /books/1.json
	def update
		@set_def_avt=params[:book][:default_avatar]
		@book.cover_page.destroy if @set_def_avt
		respond_to do |format|
			if @book.update(book_params)
				@books = Book.where("user_id = ?", current_user.id).order("title")
				@books =@books.paginate(page: params[:page], per_page: 16)
				format.html { redirect_to @book; flash[:info]= 'Book was successfully updated.' }
				format.json { render :edit, status: :ok, location: @book }
				format.js
			else
				format.html { render :edit }
				format.json { render json: @book.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# DELETE /books/1
	# DELETE /books/1.json
	def destroy
		@book.destroy
		respond_to do |format|
			format.html { redirect_to books_url; flash[:warning]= 'Book was successfully destroyed.' }
			format.json { head :no_content }
			format.js
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_book
			@book = Book.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def book_params
			params.require(:book).permit(:title, :author_id, :publisher_id, :user_id, :twitter_username, :default_avatar, :publication_date, :cover_page, :book_summary, genre_ids: [])
		end

	end
