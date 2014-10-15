class ApiController < ApplicationController

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

        p = posts.as_json

        p.zip(posts).each do |x,y|
            x["image_url"] = y.avatar.url(:medium)
        end
        render json: p
    end

end
