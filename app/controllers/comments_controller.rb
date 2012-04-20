class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(params[:comment])
		if @comment.save
			flash[:success] = "Votre commentaire a bien ete ajoute"
			redirect_to @article
		else
			render "articles/show"
		end
	end

	def edit
		
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id]).destroy
		redirect_to @article
	end
end