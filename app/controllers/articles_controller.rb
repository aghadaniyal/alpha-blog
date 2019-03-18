class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :destroy,:show]
	before_action require_user, except:[:index, :show]
	before_action require_same_user, only:[:edit, :update, :destroy]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 4)
	end

	def new
		@article = Article.new
	end

	def edit
	
	end

	def create

		@article = Article.new(article_params)
		@article.user = current_user
		if @article.save
		flash[:success] = "Article was successfully created"
		redirect_to articles_path
		
		else
		render 'new'
		end
	end

	def show
		
	end

	def update
		
		if @article.update(article_params)
			flash[:success] = "Article was successfully edited"
			redirect_to articles_path
		else
			render 'edit'
		end

	end

	def destroy
		
		@article.destroy
			flash[:danger] = "Article was successfully deleted"
			redirect_to articles_path
	end

	private  
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title,:description)
	end

	def reqire_same_user
		if current_user != @article.user
			flash[:danger] = "You cannot edit & delete other's articles"
			redirect_to root_path
		end
	end
end
