class JoinershipsController < ApplicationController
  before_filter :authenticate_user!
 
  def create
    @bid = Bid.find(params[:bid_id])
    
    if @bid.user_id == current_user.id
      respond_to do |format|
        format.html { redirect_to @bid, notice: 'You can not join your own Bid !' }
        format.json { render json: @bid.errors, status: :owner_join_prohibited }
      end
    else 
      if @bid.joiners.exists?(current_user)
        respond_to do |format|
          format.html { redirect_to @bid, notice: 'You already joined this Bid !' }
          format.json { render json: @bid.errors, status: :owner_join_prohibited }
        end
      else
        # Create the new joinership for this bid
        @joinership = @bid.joinerships.build(:joiner_id => current_user.id)
        if @joinership.save
          respond_to do |format|
            format.html { redirect_to @bid, notice: 'You joined the Bid successfully.' }
            format.json { head :ok }
          end
          # redirect_to @bid, :notice => "You Joined the bid succesfully."
        else
          respond_to do |format|
            format.html { redirect_to @bid, notice: 'Unable to Join the bid !' }
            format.json { render json: @bid.errors, status: :join_error }
          end
          # redirect_to @bid, :notice => "Unable to Join the bid."
        end
      end
    end
  end

  def destroy
    @joinership = current_user.joinerships.find(params[:id])
    # @bid = @joinership.bid
    
    @joinership.destroy
    redirect_to root_url, :notice => "Successfully removed joiner."
  end
end
