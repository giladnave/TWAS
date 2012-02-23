class JoinershipsController < ApplicationController
  before_filter :authenticate_user!
 
  def create
    @bid = Bid.find(params[:id])

    js = @bid.joinerships.create(:joiner_id => current_user.id)
    result = js.errors[:base].first || 'You joined the bid successfuly !'
    
    respond_to do |format|
      format.html { redirect_to bid_path(@bid), notice: result }
      format.json { render :json => { status: result } }
    end
  end

  def destroy
    @joinership = current_user.joinerships.find(params[:id])
    # @bid = @joinership.bid
    
    @joinership.destroy
    redirect_to root_url, :notice => "Successfully removed joiner."
  end
end
