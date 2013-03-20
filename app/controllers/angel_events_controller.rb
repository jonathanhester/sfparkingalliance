class AngelEventsController < ApplicationController
  # GET /angel_events
  # GET /angel_events.json
  def index
    @angel_events = AngelEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @angel_events }
    end
  end

  # GET /angel_events/1
  # GET /angel_events/1.json
  def show
    @angel_event = AngelEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @angel_event }
    end
  end

  # GET /angel_events/new
  # GET /angel_events/new.json
  def new
    @angel_event = AngelEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @angel_event }
    end
  end

  # GET /angel_events/1/edit
  def edit
    @angel_event = AngelEvent.find(params[:id])
  end

  # POST /angel_events
  # POST /angel_events.json
  def create
    @angel_event = AngelEvent.new(params[:angel_event])

    respond_to do |format|
      if @angel_event.save
        format.html { redirect_to @angel_event, notice: 'Angel event was successfully created.' }
        format.json { render json: @angel_event, status: :created, location: @angel_event }
      else
        format.html { render action: "new" }
        format.json { render json: @angel_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /angel_events/1
  # PUT /angel_events/1.json
  def update
    @angel_event = AngelEvent.find(params[:id])

    respond_to do |format|
      if @angel_event.update_attributes(params[:angel_event])
        format.html { redirect_to @angel_event, notice: 'Angel event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @angel_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /angel_events/1
  # DELETE /angel_events/1.json
  def destroy
    @angel_event = AngelEvent.find(params[:id])
    @angel_event.destroy

    respond_to do |format|
      format.html { redirect_to angel_events_url }
      format.json { head :no_content }
    end
  end
end
