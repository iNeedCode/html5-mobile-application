class SoccersController < ApplicationController
  # GET /soccers
  # GET /soccers.json
  def index
    @soccers = Soccer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @soccers }
    end
  end

  # GET /soccers/1
  # GET /soccers/1.json
  def show
    @soccer = Soccer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @soccer }
    end
  end

  # GET /soccers/new
  # GET /soccers/new.json
  def new
    @soccer = Soccer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @soccer }
    end
  end

  # GET /soccers/1/edit
  def edit
    @soccer = Soccer.find(params[:id])
  end

  # POST /soccers
  # POST /soccers.json
  def create
    @soccer = Soccer.new(params[:soccer])

    respond_to do |format|
      if @soccer.save
        format.html { redirect_to @soccer, notice: 'Soccer was successfully created.' }
        format.json { render json: @soccer, status: :created, location: @soccer }
      else
        format.html { render action: "new" }
        format.json { render json: @soccer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /soccers/1
  # PUT /soccers/1.json
  def update
    @soccer = Soccer.find(params[:id])

    respond_to do |format|
      if @soccer.update_attributes(params[:soccer])
        format.html { redirect_to @soccer, notice: 'Soccer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @soccer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soccers/1
  # DELETE /soccers/1.json
  def destroy
    @soccer = Soccer.find(params[:id])
    @soccer.destroy

    respond_to do |format|
      format.html { redirect_to soccers_url }
      format.json { head :no_content }
    end
  end
end
