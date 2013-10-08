class AtfalEventsController < ApplicationController
  # GET /atfal_events
  # GET /atfal_events.json
  def index
    @atfal_events = AtfalEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.csv { send_data(@atfal_events.to_csv(:except => [:created_at, :updated_at])) }
      format.json { render json: @atfal_events }
    end
  end

  # GET /atfal_events/1
  # GET /atfal_events/1.json
  def show
    @atfal_event = AtfalEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atfal_event }
    end
  end

  # GET /atfal_events/new
  # GET /atfal_events/new.json
  def new
    @atfal_event = AtfalEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atfal_event }
    end
  end

  # GET /atfal_events/1/edit
  def edit
    @atfal_event = AtfalEvent.find(params[:id])
  end

  # POST /atfal_events
  # POST /atfal_events.json
  def create
    @atfal_event = AtfalEvent.new(params[:atfal_event])

    respond_to do |format|
      if @atfal_event.save
        format.html { redirect_to @atfal_event, notice: 'Atfal event was successfully created.' }
        format.json { render json: @atfal_event, status: :created, location: @atfal_event }
      else
        format.html { render action: "new" }
        format.json { render json: @atfal_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atfal_events/1
  # PUT /atfal_events/1.json
  def update
    @atfal_event = AtfalEvent.find(params[:id])

    respond_to do |format|
      if @atfal_event.update_attributes(params[:atfal_event])
        format.html { redirect_to @atfal_event, notice: 'Atfal event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atfal_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atfal_events/1
  # DELETE /atfal_events/1.json
  def destroy
    @atfal_event = AtfalEvent.find(params[:id])
    @atfal_event.destroy

    respond_to do |format|
      format.html { redirect_to atfal_events_url }
      format.json { head :no_content }
    end
  end

  def import
    AtfalEvent.import(params[:file])
    redirect_to atfal_events_url, notice: "Atfal Programm importiert"
  end

end
