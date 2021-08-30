class DevelopmentsController < ApplicationController
  before_action :set_development, only: %i[ show edit update destroy add_keyword remove_keyword ]


  # GET /developments or /developments.json
  def index
    @developments = Development.all
  end

  # GET /developments/1 or /developments/1.json
  def show
  end

  # GET /developments/new
  def new
    @development = Development.new
  end

  # GET /developments/1/edit
  def edit
  end

  # POST /developments or /developments.json
  def create
    @development = Development.new(development_params)

    respond_to do |format|
      if @development.save
        format.html { redirect_to @development, notice: "Development was successfully created." }
        format.json { render :show, status: :created, location: @development }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developments/1 or /developments/1.json
  def update
    respond_to do |format|
      if @development.update(development_params)
        format.html { redirect_to @development, notice: "Development was successfully updated." }
        format.json { render :show, status: :ok, location: @development }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developments/1 or /developments/1.json
  def destroy
    @development.destroy
    respond_to do |format|
      format.html { redirect_to developments_url, notice: "Development was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_keyword
    Keyword.all.each do |keyword|
      s = params['check'+ keyword.id.to_s]
      if !s.blank?
        Assignedkeyword.create(:name => keyword.name, :development_id => @development.id)
      end
    end


    redirect_to edit_development_path(@development)

  end

  def remove_keyword
    @development.assignedkeywords.each do |keyword|
      s = params['check'+ keyword.id.to_s]
      if !s.blank?
        @development.assignedkeywords.delete(keyword)
      end
    end


    redirect_to edit_development_path(@development)

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_development
      @development = Development.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def development_params
      params.require(:development).permit(:name, :description, :keywords, :significance_in_sector, :significance_general)
    end
end
