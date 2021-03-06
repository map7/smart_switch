class ButtonsController < ApplicationController
  before_action :set_button, only: [:show, :edit, :update, :destroy]

  def on
    button = Button.find(params[:id])
    button.on
    redirect_to buttons_url, notice: "Button turned on"
  end

  def off
    button = Button.find(params[:id])
    button.off
    redirect_to buttons_url, notice: "Button turned off"
  end

  def toggle
    button = Button.find(params[:id])
    button.toggle
    redirect_to buttons_url, notice: "Button turned #{button.power_status ? 'on' : 'off'}"
  end

  def all_on
    Button.all.each { |btn| btn.on }
    flash[:notice]
    redirect_to buttons_url, notice: "All buttons turned on"
  end

  def all_off
    Button.all.each { |btn| btn.off }
    flash[:notice]
    redirect_to buttons_url, notice: "All buttons turned off"
  end
  
  # GET /buttons
  # GET /buttons.json
  def index
    @buttons = Button.all
  end

  # GET /buttons/1
  # GET /buttons/1.json
  def show
  end

  # GET /buttons/new
  def new
    @button = Button.new
  end

  # GET /buttons/1/edit
  def edit
  end

  # POST /buttons
  # POST /buttons.json
  def create
    @button = Button.new(button_params)

    respond_to do |format|
      if @button.save
        format.html { redirect_to @button, notice: 'Button was successfully created.' }
        format.json { render :show, status: :created, location: @button }
      else
        format.html { render :new }
        format.json { render json: @button.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buttons/1
  # PATCH/PUT /buttons/1.json
  def update
    respond_to do |format|
      if @button.update(button_params)
        format.html { redirect_to @button, notice: 'Button was successfully updated.' }
        format.json { render :show, status: :ok, location: @button }
      else
        format.html { render :edit }
        format.json { render json: @button.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buttons/1
  # DELETE /buttons/1.json
  def destroy
    @button.destroy
    respond_to do |format|
      format.html { redirect_to buttons_url, notice: 'Button was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_button
      @button = Button.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def button_params
      params.require(:button).permit(:name, :on_command, :off_command, :power_status)
    end
end
