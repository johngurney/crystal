class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @development = Development.find(params[:development_id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @development = Development.find(@event.development_id)
  end

  # POST /events or /events.json
  def create
    puts "***" + params[:event][:development_id].to_s

    @development = Development.find(params[:event][:development_id].to_i)

    @event = @development.events.create(event_params)
    # @event = @development.events.create(:description => params[:event][:description])
    @event.save

    redirect_to edit_development_path(@development)

    # respond_to do |format|
    #   if @event.save
    #     format.html { redirect_to @event, notice: "Event was successfully created." }
    #     format.json { render :show, status: :created, location: @event }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
      redirect_to edit_development_path(Development.find(@event.development_id))
    else
      redirect_to edit_event_path(@event)
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    development = Development.find(@event.development_id)
    @event.destroy
    redirect_to edit_development_path(development)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :start_date, :end_date, :description, :policy_action)
    end
end
