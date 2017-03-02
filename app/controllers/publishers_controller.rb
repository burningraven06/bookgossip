class PublishersController < ApplicationController
	before_action :require_login
	before_action :set_publisher, only: [:show, :edit, :update, :destroy]

	# GET /publishers
	# GET /publishers.json
	def index
		params[:search] ?	@publishers=Publisher.search(params[:search]) : @publishers= Publisher.all
		@publishers = @publishers.order(:name).paginate(page: params[:page], per_page: 18)
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publishers}
      format.js
    end
  end

	# GET /publishers/1
	# GET /publishers/1.json
	def show
		@publisher = Publisher.find(params[:id])
		@books_of_publisher = @publisher.books.order(title: :asc).paginate(page: params[:page], per_page: 24)
		respond_to do |format|
			format.html {}
			format.json {}
			format.js
		end
	end

	# GET /publishers/new
	def new
		@publisher = Publisher.new
	end

	# GET /publishers/1/edit
	def edit
	end

	# POST /publishers
	# POST /publishers.json
	def create
		@publisher = Publisher.new(publisher_params)
		respond_to do |format|
			if @publisher.save
				@publishers = Publisher.order(:name).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @publisher; flash[:success]= 'Publisher was successfully created.' }
				format.json { render :show, status: :created, location: @publisher }
				format.js
			else
				format.html { render :new }
				format.json { render json: @publisher.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# PATCH/PUT /publishers/1
	# PATCH/PUT /publishers/1.json
	def update
		@set_def_avt=params[:publisher][:default_avatar]
		@publisher.cover_page.destroy if @set_def_avt
		respond_to do |format|
			if @publisher.update(publisher_params)
				@publishers = Publisher.order(:name).paginate(page: params[:page], per_page: 18)
				format.html { redirect_to @publisher; flash[:info]= 'Publisher was successfully updated.' }
				format.json { render :show, status: :ok, location: @publisher }
				format.js
			else
				format.html { render :edit }
				format.json { render json: @publisher.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# DELETE /publishers/1
	# DELETE /publishers/1.json
	def destroy
		@publisher.destroy
		respond_to do |format|
			format.html { redirect_to publishers_url; flash[:warning]= 'Publisher was successfully destroyed.' }
			format.json { head :no_content }
			format.js
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_publisher
			@publisher = Publisher.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def publisher_params
			params.require(:publisher).permit(:name, :address, :website, :cover_page)
		end
	end
