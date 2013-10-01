class InternationalVolleyballsController < ApplicationController
  # GET /international_volleyballs
  # GET /international_volleyballs.json
  def index
    @international_volleyballs = InternationalVolleyball.order("startime ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @international_volleyballs }
    end
  end

  # GET /international_volleyballs/1
  # GET /international_volleyballs/1.json
  def show
    @international_volleyball = InternationalVolleyball.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @international_volleyball }
    end
  end

  # GET /international_volleyballs/new
  # GET /international_volleyballs/new.json
  def new
    @international_volleyball = InternationalVolleyball.new(duration: 20)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @international_volleyball }
    end
  end

  # GET /international_volleyballs/1/edit
  def edit
    @international_volleyball = InternationalVolleyball.find(params[:id])
  end

  # POST /international_volleyballs
  # POST /international_volleyballs.json
  def create
    @international_volleyball = InternationalVolleyball.new(params[:international_volleyball])
    @international_volleyball.endtime =  @international_volleyball.startime +  @international_volleyball.duration*60    

    respond_to do |format|
      if @international_volleyball.save
        format.html { redirect_to @international_volleyball, notice: 'International volleyball was successfully created.' }
        format.json { render json: @international_volleyball, status: :created, location: @international_volleyball }
      else
        format.html { render action: "new" }
        format.json { render json: @international_volleyball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /international_volleyballs/1
  # PUT /international_volleyballs/1.json
  def update
    @international_volleyball = InternationalVolleyball.find(params[:id])

    respond_to do |format|
      if @international_volleyball.update_attributes(params[:international_volleyball])
         @international_volleyball.endtime =  @international_volleyball.startime +  @international_volleyball.duration*60    
        format.html { redirect_to @international_volleyball, notice: 'International volleyball was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @international_volleyball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /international_volleyballs/1
  # DELETE /international_volleyballs/1.json
  def destroy
    @international_volleyball = InternationalVolleyball.find(params[:id])
    @international_volleyball.destroy

    respond_to do |format|
      format.html { redirect_to international_volleyballs_url }
      format.json { head :no_content }
    end
  end
end
