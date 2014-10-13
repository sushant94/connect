class PostsController < ApplicationController
    before_action :authenticate_user!

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
    end

    private

    def replaceRelationsByObjects object
    end

    def post_params
        params.require(:post).permit(:title, :author, :category, :content, :event, :event_start, :event_end, :venue,:avatar)
    end

end

