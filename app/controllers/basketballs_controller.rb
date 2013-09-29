class BasketballsController < ApplicationController
  # GET /basketballs
  # GET /basketballs.json
  def index
    @basketballs = Basketball.order("startime ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @basketballs }
    end
  end

  # GET /basketballs/1
  # GET /basketballs/1.json
  def show
    @basketball = Basketball.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @basketball }
    end
  end

  # GET /basketballs/new
  # GET /basketballs/new.json
  def new
    @basketball = Basketball.new(duration: 20)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basketball }
    end
  end

  # GET /basketballs/1/edit
  def edit
    @basketball = Basketball.find(params[:id])
  end

  # POST /basketballs
  # POST /basketballs.json
  def create
    @basketball = Basketball.new(params[:basketball])
    @basketball.endtime =  @basketball.startime +  @basketball.duration*60

    respond_to do |format|
      if @basketball.save
        format.html { redirect_to @basketball, notice: 'Basketball was successfully created.' }
        format.json { render json: @basketball, status: :created, location: @basketball }
      else
        format.html { render action: "new" }
        format.json { render json: @basketball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /basketballs/1
  # PUT /basketballs/1.json
  def update
    @basketball = Basketball.find(params[:id])

    respond_to do |format|
      if @basketball.update_attributes(params[:basketball])
        @basketball.endtime =  @basketball.startime +  @basketball.duration*60
        format.html { redirect_to @basketball, notice: 'Basketball was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @basketball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basketballs/1
  # DELETE /basketballs/1.json
  def destroy
    @basketball = Basketball.find(params[:id])
    @basketball.destroy

    respond_to do |format|
      format.html { redirect_to basketballs_url }
      format.json { head :no_content }
    end
  end
end
