class ApiController < ApplicationController
    before_action :headers

    #params[:after] should be UNIX timestamp.
    # Specify category for filtering.
    def list
        if params[:after].nil?
            posts = Post.all.order("created_at DESC")
        elsif params[:category].nil?
            posts = Post.where("created_at > ?", Time.at(params[:after].to_i).to_datetime).order("created_at DESC")
        else
            posts = Post.where("created_at > ? AND category = ?", Time.at(params[:after].to_i).to_datetime, params[:category]).order("created_at DESC")
        end
        render json: posts
    end

end
