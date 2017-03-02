class MembershipsController < ApplicationController
	def new
		respond_to do |format|
			@group = Group.find(params[:id])
			@membership = Membership.new
			format.html {}
			format.json
			format.js
		end
	end

	def index
		@groups = Group.where("user_id = ?", current_user.id)
		@groups.each do |g|
			@memberships = Membership.where("group_id = ?", g.id)
		end
		@memberships.each do |m|
			@approved_members = @memberships.where("request_approved = ? ", true)
			@pending_members = @memberships.where("request_approved = ? ", false)
		end
		@approved_members = @approved_members.paginate(page: params[:page], per_page: 15)
		@pending_members = @pending_members.paginate(page: params[:page], per_page: 15)

		respond_to do |format|
			format.html{}
			format.json
			format.js
		end
	end 	

	def show
		@membership = Membership.find(params[:id])
		respond_to do |format|
			format.html{}
			format.json
			format.js
		end
	end

	def edit 
		@membership = Membership.find(params[:id])
		respond_to do |format|
			format.html{}
			format.json
			format.js
		end
	end

	def create
		@group = Group.find(params[:id])
		@membership = @group.memberships.create(user_id: current_user.id)
		@membership.request_approved = false
		if @membership.save
			respond_to do |format|
				format.html { redirect_to @group,	notice: 'Membership Created' }
				format.json
				format.js
			end
		else 
			render 'new'
		end
	end

	def update
		@membership = Membership.find(params[:id])
		@group = Group.find_by_id(@membership.group_id)

		@membership.request_approved = params[:membership][:request_approved]
		@membership.save

		if @membership.request_approved
			@group.member_count = @group.member_count+1
			@group.save			
			respond_to do |format|
				format.html { redirect_to memberships_path; flash[:info] = 'Membership was successfully updated.'  }
				format.json
			end
		else 
			@membership.destroy
			respond_to do |format|
				format.html { redirect_to memberships_path; flash[:warning] = 'Membership was successfully deleted.' }
				format.json
			end
		end
	end

	def destroy
		@membership = Membership.find(params[:id])
		@membership.destroy
		respond_to do |format|
			format.html { redirect_to memberships_path; flash[:warning] = 'Membership was successfully deleted.' }
			format.json
		end		
	end
end