class BidsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index]
  
  # PUT /bids/join/1
  # PUT /bids/join/1.json
  def join
    @bid = Bid.find(params[:id])
    # @bid.title = "Joined"

    respond_to do |format|
      if @bid.user_id == current_user.id
        format.html { redirect_to @bid, notice: 'You can not join your own Bid !' }
        format.json { render json: @bid.errors, status: :owner_join_prohibited }
      else
        # update the bid with the joined user
        @bid.join_count = @bid.join_count + 1
         
        if @bid.update_attributes(params[:bid])
          format.html { redirect_to @bid, notice: 'You joined the Bid successfully.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bids }
    end
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
    @bid = Bid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bid }
    end
  end

  # GET /bids/new
  # GET /bids/new.json
  def new
    @bid = current_user.bid.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bid }
    end
  end

  # GET /bids/1/edit
  def edit
    @bid = Bid.find(params[:id])
    respond_to do |format|
      if @bid.user_id != current_user.id
        format.html { redirect_to @bid, notice: 'You can not edit a bid of other owner !' }
        format.json { render json: @bid.errors, status: :edit_prohibited }
      end
    end
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = current_user.bid.build(params[:bid])
        
    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render json: @bid, status: :created, location: @bid }
      else
        format.html { render action: "new" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bids/1
  # PUT /bids/1.json
  def update
    @bid = Bid.find(params[:id])

    respond_to do |format|
      
        if @bid.update_attributes(params[:bid])
          format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid = Bid.find(params[:id])
    
    respond_to do |format|
      if @bid.user_id != current_user.id
        format.html { redirect_to @bid, notice: 'You can not delete a bid of other owner !' }
        format.json { render json: @bid.errors, status: :destroy_prohibited }
      else
        @bid.destroy
      
        format.html { redirect_to bids_url }
        format.json { head :ok }
      end
    end
  end
end
