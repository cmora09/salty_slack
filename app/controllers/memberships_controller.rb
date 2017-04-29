class MembershipsController < ApplicationController
	
  skip_before_action :verify_authenticity_token, only: [:create]

  def index

  	@chatroom = Chatroom.find(params[:chatroom_id])

  	redirect_with_flash unless member_of_group

  	@memberships = Membership.where(chatroom_id: params[:chatroom_id])

  	@users = User.where.not(id: @memberships.pluck(:user_id))

  end

  def create

  	unless membership_params.nil?
  		@user = User.find(params[:user_id])
   		@chatroom = Chatroom.find(params[:chatroom_id])

	    @membership = Membership.new(membership_params)

	  	if @membership.save
	  		response = { membership: @membership, user: @user }
	  		render json: response
	  	else
	    	flash[:error] = "There was an error adding that user to the channel."
	  	end
	end

  end

  private

 	def membership_params
 		params.require(:membership).permit(:user_id,:chatroom_id)
 	end
end
