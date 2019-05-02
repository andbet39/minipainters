class MiniaturesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_miniature, only: [:show, :edit, :update, :destroy]

  # GET /miniatures
  # GET /miniatures.json
  def index
    @miniatures = Miniature.all
  end

  # GET /miniatures/1
  # GET /miniatures/1.json
  def show
  end

  # GET /miniatures/new
  def new
    @miniature = Miniature.new
  end

  # GET /miniatures/1/edit
  def edit
  end

  # POST /miniatures
  # POST /miniatures.json
  def create
    @miniature = Miniature.new(miniature_params)

    respond_to do |format|
      if @miniature.save
        format.html { redirect_to @miniature, notice: 'Miniature was successfully created.' }
        format.json { render :show, status: :created, location: @miniature }
      else
        format.html { render :new }
        format.json { render json: @miniature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miniatures/1
  # PATCH/PUT /miniatures/1.json
  def update
    respond_to do |format|
      if @miniature.update(miniature_params)
        format.html { redirect_to @miniature, notice: 'Miniature was successfully updated.' }
        format.json { render :show, status: :ok, location: @miniature }
      else
        format.html { render :edit }
        format.json { render json: @miniature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miniatures/1
  # DELETE /miniatures/1.json
  def destroy
    @miniature.destroy
    respond_to do |format|
      format.html { redirect_to miniatures_url, notice: 'Miniature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miniature
      @miniature = Miniature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miniature_params
      params.require(:miniature).permit(:title, :description, :user_id, pictures:[])
    end
end
