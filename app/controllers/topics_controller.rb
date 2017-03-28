class TopicsController < ApplicationController
	before_action :require_login
	before_action :set_topic, only: [:show, :edit, :update, :destroy]

	# GET /topics
	# GET /topics.json
	def index
		params[:search] ? @topics=Topic.search(params[:search]) : @topics= Topic.all
		@topics = @topics.order(:heading).paginate(page: params[:page], per_page: 18)
		respond_to do |format|
			format.html{}
			format.json{}
			format.js
		end
	end

	# GET /topics/1
	# GET /topics/1.json
	def show
		@topic = Topic.find(params[:id])
		@replies_of_topic = @topic.topic_replies
		respond_to do |format|
			format.html{}
			format.json{}
			format.js
		end
	end

	# GET /topics/new
	def new
		@group = Group.find(params[:id])
		@topic = Topic.new
		respond_to do |format|
			format.html{}
			format.json{}
			format.js
		end
	end

	# GET /topics/1/edit
	def edit
		@topic = Topic.find(params[:id])
		respond_to do |format|
			format.html{}
			format.json{}
			format.js
		end  
	end

	# POST /topics
	# POST /topics.json
	def create
		@group = Group.find(params[:id])
		@topic = Topic.new(topic_params)
		@topic.user_id = current_user.id
		@topic.group_id = @group.id
		@topic.reply_count = 0
		respond_to do |format|
			if @topic.save
				@group.post_count = @group.post_count + 1
				@group.save
				@topics_of_group = @group.topics.order(heading: :asc).paginate(page: params[:page], per_page: 24)
				format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
				format.json { render :show, status: :created, location: @topic }
				format.js
			else
				format.html { render :new }
				format.json { render json: @topic.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# PATCH/PUT /topics/1
	# PATCH/PUT /topics/1.json
	def update
		respond_to do |format|
			if @topic.update(topic_params)
				format.html { redirect_to @topic; flash[:info]= 'Topic was successfully updated.' }
				format.json { render :show, status: :ok, location: @topic }  
			else
				format.html { render :edit }
				format.json { render json: @topic.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /topics/1
	# DELETE /topics/1.json
	def destroy
		@group = Group.find_by_id(@topic.group.id)
		@topic.destroy
		respond_to do |format|
			format.html { redirect_to @group; flash[:warning] = "Topic was successfully destroyed." }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_topic
			@topic = Topic.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def topic_params
			params.require(:topic).permit(:heading, :body, :user_id, :group_id, :default_avatar, :topic_icon)
		end
	end
