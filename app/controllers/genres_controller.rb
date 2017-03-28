class GenresController < ApplicationController
	before_action :require_login
	before_action :set_genre, only: [:show, :edit, :update, :destroy]

	# GET /genres
	# GET /genres.json
	def index
		params[:search] ? @genres=Genre.search(params[:search]) : @genres= Genre.all
		@genres = @genres.order(:name).paginate(page: params[:page], per_page: 18)
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @genres }
			format.js
		end
	end

	# GET /genres/1
	# GET /genres/1.json
	def show
		@genre = Genre.find(params[:id])
		@books_of_genre = @genre.books.order(title: :asc).paginate(page: params[:page], per_page: 24)
		respond_to do |format|
			format.html {}
			format.json {}
			format.js
		end
	end

	# GET /genres/new
	def new
		@genre = Genre.new
	end

	# GET /genres/1/edit
	def edit
	end

	# POST /genres
	# POST /genres.json
	def create
		@genre = Genre.new(genre_params)
		respond_to do |format|
			if @genre.save
				@genres = Genre.order(:name).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @genre; flash[:success]= 'Genre was successfully created.' }
				format.json { render :show, status: :created, location: @genre }
				format.js
			else
				format.html { render :new }
				format.json { render json: @genre.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# PATCH/PUT /genres/1
	# PATCH/PUT /genres/1.json
	def update
		@set_def_avt=params[:genre][:default_avatar]
		@genre.cover_page.destroy if @set_def_avt

		respond_to do |format|
			if @genre.update(genre_params)
				@genres = Genre.order(:name).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @genre; flash[:info]= 'Genre was successfully updated.' }
				format.json { render :show, status: :ok, location: @genre }
				format.js
			else
				format.html { render :edit }
				format.json { render json: @genre.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# DELETE /genres/1
	# DELETE /genres/1.json
	def destroy
		@genre.destroy
		respond_to do |format|
			format.html { redirect_to genres_url; flash[:warning]= 'Genre was successfully destroyed.' }
			format.json { head :no_content }
			format.js
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_genre
			@genre = Genre.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def genre_params
			params.require(:genre).permit(:name, :cover_page)
		end
	end
