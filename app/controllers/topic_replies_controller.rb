class TopicRepliesController < ApplicationController
	before_action :require_login
	before_action :set_topic_reply, only: [:show, :edit, :update, :destroy]

	# GET /topic_replies
	# GET /topic_replies.json
	def index
	end

	# GET /topic_replies/1
	# GET /topic_replies/1.json
	def show
	end

	# GET /topic_replies/new
	def new
		@topic = Topic.find(params[:id])
		@topic_reply = TopicReply.new
		respond_to do |format|
			format.html {}
			format.js {}
		end 
	end

	# GET /topic_replies/1/edit
	def edit
	end

	# POST /topic_replies
	# POST /topic_replies.json
	def create
		@topic = Topic.find(params[:id])
		@topic_reply = TopicReply.new(topic_reply_params)
		@topic_reply.user_id = current_user.id
		@topic_reply.topic_id = @topic.id
		@replies_of_topic = 
		respond_to do |format|
			if @topic_reply.save
				@topic.reply_count = @topic.reply_count+1
				@topic.save
				format.html { redirect_to @topic, notice: 'Topic reply was successfully created.' }
				format.json { render :show, status: :created, location: @topic_reply }
				format.js
			else
				format.html { render :new }
				format.json { render json: @topic_reply.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	# PATCH/PUT /topic_replies/1
	# PATCH/PUT /topic_replies/1.json
	def update
		respond_to do |format|
			if @topic_reply.update(topic_reply_params)
				format.html { redirect_to @topic_reply, notice: 'Topic reply was successfully updated.' }
				format.json { render :show, status: :ok, location: @topic_reply }
			else
				format.html { render :edit }
				format.json { render json: @topic_reply.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /topic_replies/1
	# DELETE /topic_replies/1.json
	def destroy
		@topic_reply.destroy
		respond_to do |format|
			format.html { redirect_to topic_replies_url, notice: 'Topic reply was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_topic_reply
			@topic_reply = TopicReply.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def topic_reply_params
			params.require(:topic_reply).permit(:topic, :user, :content)
		end
	end
