class BidObserver < ActiveRecord::Observer
  def after_update(bid)
    puts "\n\n\n ------------ Bid: #{bid.changes} ------------ \n\n\n"
  end
end
