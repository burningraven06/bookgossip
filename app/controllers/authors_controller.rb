class AuthorsController < ApplicationController
	before_action :require_login
	before_action :set_author, only: [:show, :edit, :update, :destroy]

	# GET /authors
	# GET /authors.json
	def index
		# @authors = Author.order(:name).paginate(page: params[:page], per_page: 18)
		params[:search] ?	@authors=Author.search(params[:search]) :	@authors= Author.all
		@authors = @authors.order(:name).paginate(page: params[:page], per_page: 18)
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors}
      format.js
    end
  end

	# GET /authors/1
	# GET /authors/1.json
	def show
		respond_to do |format|
			@author=Author.find(params[:id])
			@books_of_author = @author.books.order(title: :asc).paginate(page: params[:page], per_page: 24)
			format.html {}
			format.json {}
			format.js
		end
	end
	# GET /authors/new
	def new
		@author = Author.new
	end

	# GET /authors/1/edit
	def edit
	end

	# POST /authors
	# POST /authors.json
	def create
		@author = Author.new(author_params)
		respond_to do |format|
			if @author.save
				@authors = Author.order(:name).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @author; flash[:success]= "Author was successfully created." }
				format.json { render :show, status: :created, location: @author }
				format.js
			else
				format.html { render :new }
				format.json { render json: @author.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# PATCH/PUT /authors/1
	# PATCH/PUT /authors/1.json
	def update
		@set_def_avt=params[:author][:default_avatar]
		@author.avatar.destroy if @set_def_avt
		respond_to do |format|
			if @author.update(author_params)
				@authors = Author.order(:name).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @author;	flash[:info]= "Author was successfully updated." }
				format.json { render :show, status: :ok, location: @author }
				format.js
			else
				format.html { render :edit }
				format.json { render json: @author.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# DELETE /authors/1
	# DELETE /authors/1.json
	def destroy
		@author.destroy
		respond_to do |format|
			format.html { redirect_to authors_url; flash[:warning]= "Author was successfully destroyed." }
			format.json { head :no_content }
			format.js
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_author
			@author = Author.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def author_params
			params.require(:author).permit(:name, :date_of_birth, :bio, :avatar)
		end
	end
