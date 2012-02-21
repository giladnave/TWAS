module UsersHelper
  def bid_list_for(user)
    render 'bids/list', :bids => @user.bids
  end

  def bids_joined(user)
    # TODO: Make @user.joined
    render 'bids/list', :bids => Bid.joins(:joiners).joins(:user).where('users.id = ?', user.id)
  end
end
