class PublishesController < ApplicationController
  before_action :set_publish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  
  # GET /publishes
  # GET /publishes.json
  def index
    @publishes = Publish.all
  end

  # GET /publishes/1
  # GET /publishes/1.json
  def show
  end

  # GET /publishes/new
  def new
    @publish = Publish.new
  end

  # GET /publishes/1/edit
  def edit
  end

  # POST /publishes
  # POST /publishes.json
  def create
    @publish = Publish.new(publish_params)

    respond_to do |format|
      if @publish.save
        format.html { redirect_to @publish, notice: 'Publish was successfully created.' }
        format.json { render action: 'show', status: :created, location: @publish }
      else
        format.html { render action: 'new' }
        format.json { render json: @publish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishes/1
  # PATCH/PUT /publishes/1.json
  def update
    respond_to do |format|
      if @publish.update(publish_params)
        format.html { redirect_to @publish, notice: 'Publish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @publish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishes/1
  # DELETE /publishes/1.json
  def destroy
    @publish.destroy
    respond_to do |format|
      format.html { redirect_to publishes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publish
      @publish = Publish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publish_params
      params.require(:publish).permit(:publishTitle, :user_id)
    end
end
