class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:edit, :update]

    attr_accessor :image

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            @post.user_id = current_user.id
            @post.save
            redirect_to action: 'success'
        else
            render 'new'
        end
    end

    def success
    end

    def fail
    end

    def show
        @posts = Post.all.where(:user_id => current_user.id)
    end

    def dashboard
    end

    def edit
        if @post.user_id != current_user.id
            redirect_to action: 'dashboard'
        end

    end

    def update
        if @post.update(post_params)
            redirect_to action: 'success'
        else
            render 'edit'
        end
    end

    private

    def replaceRelationsByObjects object
    end

    def post_params
        params.require(:post).permit(:title, :author, :category, :content, :event, :event_start, :event_end, :venue,:avatar)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end

