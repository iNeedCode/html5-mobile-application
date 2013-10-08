class VolleyballsController < ApplicationController
  # GET /volleyballs
  # GET /volleyballs.json
  def index
    @volleyballs = Volleyball.order("startime ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.csv { send_data(@volleyballs.to_csv(:except => [:created_at, :updated_at])) }
      format.json { render json: @volleyballs }
    end
  end

  # GET /volleyballs/1
  # GET /volleyballs/1.json
  def show
    @volleyball = Volleyball.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volleyball }
    end
  end

  # GET /volleyballs/new
  # GET /volleyballs/new.json
  def new
    @volleyball = Volleyball.new(duration: 20)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volleyball }
    end
  end

  # GET /volleyballs/1/edit
  def edit
    @volleyball = Volleyball.find(params[:id])
  end

  # POST /volleyballs
  # POST /volleyballs.json
  def create
    @volleyball = Volleyball.new(params[:volleyball])
    @volleyball.endtime =  @volleyball.startime +  @volleyball.duration*60

    respond_to do |format|
      if @volleyball.save
        format.html { redirect_to @volleyball, notice: 'Volleyball was successfully created.' }
        format.json { render json: @volleyball, status: :created, location: @volleyball }
      else
        format.html { render action: "new" }
        format.json { render json: @volleyball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volleyballs/1
  # PUT /volleyballs/1.json
  def update
    @volleyball = Volleyball.find(params[:id])

    respond_to do |format|
      if @volleyball.update_attributes(params[:volleyball])
        @volleyball.endtime =  @volleyball.startime +  @volleyball.duration*60
        format.html { redirect_to @volleyball, notice: 'Volleyball was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @volleyball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volleyballs/1
  # DELETE /volleyballs/1.json
  def destroy
    @volleyball = Volleyball.find(params[:id])
    @volleyball.destroy

    respond_to do |format|
      format.html { redirect_to volleyballs_url }
      format.json { head :no_content }
    end
  end

  def import
    Volleyball.import(params[:file])
    redirect_to volleyballs_url, notice: "Volleyballspiele importiert"
  end
end
