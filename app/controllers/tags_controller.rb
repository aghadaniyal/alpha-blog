 class TagsController < ApplicationController 


 	

 	def new
 		@tag = Tag.new
 	end

 	def create
 		@tag = Tag.new(tag_params)

 	end

 	def edit
 		@tag = Tag.find(params[:id])
 	end


 	def update
 	 
 	end	

 	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
			flash[:danger] = "Article was successfully deleted"
			redirect_to articles_path
	end

 	private

 	def tag_params
 		params.require(:tag).permit(:name)
 	end

 end