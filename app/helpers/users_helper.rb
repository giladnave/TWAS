module UsersHelper
  def bid_list_for(user)
    render 'bids/list', :bids => @user.bids
  end

  def bids_joined(user)
    render 'bids/list', :bids => @user.joined
  end
end
