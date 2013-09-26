class CricketsController < ApplicationController
  # GET /crickets
  # GET /crickets.json
  def index
    @crickets = Cricket.order("startime ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crickets }
    end
  end

  # GET /crickets/1
  # GET /crickets/1.json
  def show
    @cricket = Cricket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cricket }
    end
  end

  # GET /crickets/new
  # GET /crickets/new.json
  def new
    @cricket = Cricket.new(duration: 20)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cricket }
    end
  end

  # GET /crickets/1/edit
  def edit
    @cricket = Cricket.find(params[:id])
  end

  # POST /crickets
  # POST /crickets.json
  def create
    @cricket = Cricket.new(params[:cricket])
    @cricket.endtime =  @cricket.startime +  @cricket.duration*60

    respond_to do |format|
      if @cricket.save
        format.html { redirect_to @cricket, notice: 'Cricket was successfully created.' }
        format.json { render json: @cricket, status: :created, location: @cricket }
      else
        format.html { render action: "new" }
        format.json { render json: @cricket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crickets/1
  # PUT /crickets/1.json
  def update
    @cricket = Cricket.find(params[:id])

    respond_to do |format|
      if @cricket.update_attributes(params[:cricket])
         @cricket.endtime = @cricket.startime +  @cricket.duration*60
         @cricket.save!
        format.html { redirect_to @cricket, notice: 'Cricket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cricket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crickets/1
  # DELETE /crickets/1.json
  def destroy
    @cricket = Cricket.find(params[:id])
    @cricket.destroy

    respond_to do |format|
      format.html { redirect_to crickets_url }
      format.json { head :no_content }
    end
  end
end
