class PublicationsController < ApplicationController
	def create
		@publication = current_user.publications.new(publication_params)

		if @publication.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end
	def show
		@publication = Publication.find(params[:id])
	end

	private

	def publication_params
		params.require(:publication).permit(:body)	
	end

end
