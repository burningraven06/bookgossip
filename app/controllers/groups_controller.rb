class GroupsController < ApplicationController
  before_action :require_login
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    params[:search] ? @groups = Group.search(params[:search]) : @groups = Group.all
    @groups = @groups.order(:name).paginate(page: params[:page], per_page: 18)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
      format.js
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @topics_of_group = @group.topics.order(heading: :asc).paginate(page: params[:page], per_page: 12)
    @membership = Membership.new({group: @group})
    respond_to do |format|
      format.html {}
      format.json {}
      format.js
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
    respond_to do |format|
      format.html {}
      format.json {}
      format.js
    end
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.user_id=current_user.id
    @group.member_count = 1
    @group.post_count = 0
    respond_to do |format|
      if @group.save
        @membership = @group.memberships.create(user_id: current_user.id)
        @membership.request_approved = true
        @membership.save
        @groups = Group.order(:name).paginate(page: params[:page], per_page: 18)
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
        format.js
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @set_def_avt=params[:group][:default_avatar]
    @group.cover_page.destroy if @set_def_avt

    respond_to do |format|
      if @group.update(group_params)
        @groups = Group.order(:name).paginate(page: params[:page], per_page: 18)

        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:user_id, :name, :description, :cover_page, :default_avatar)
    end
  end
