class PostController < ApplicationController
    
    get '/posts/new' do
        erb :new
    end
    
    post '/posts' do
        Post.create(params[:post])
        redirect '/posts'
    end

    get '/posts' do
        @posts = Post.all
        erb :index
    end

    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :show
    end

    get '/posts/:id/edit' do
        @post = Post.find(params[:id])
        erb :edit
    end

    patch '/posts/:id' do
        post = Post.find(params[:id])
        post.update(params[:post])
        redirect "/posts/#{post.id}"
    end

    delete '/posts/:id/delete' do
        post = Post.find(params[:id])
        post.destroy
        erb :delete
    end

end