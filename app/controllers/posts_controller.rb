class PostsController < ApplicationController
  before_action :find_group
  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
  before_action :member_required, :only => [:new, :create ]

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.new(post_params)

    if @post.save
      redirect_to group_path(@group)
    else
       render :new
    end
  end

  def new
    @post = @group.posts.build
  end

  def update
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  private
    def  find_group
      @group = Group.find(params[:group_id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

    def member_required
      if !current_user.is_member_of?(@group)
        flash[:warning] = " You are not member of this group!"
        redirect_to group_path(@group)
      end
    end

end
