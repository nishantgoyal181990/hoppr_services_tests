class TelcosController < ApplicationController
  # GET /telcos
  # GET /telcos.json
  def index
    @telcos = Telco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @telcos }
    end
  end

  # GET /telcos/1
  # GET /telcos/1.json
  def show
    @telco = Telco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @telco }
    end
  end

  # GET /telcos/new
  # GET /telcos/new.json
  def new
    @telco = Telco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @telco }
    end
  end

  # GET /telcos/1/edit
  def edit
    @telco = Telco.find(params[:id])
  end

  # POST /telcos
  # POST /telcos.json
  def create
    @telco = Telco.new(params[:telco])

    respond_to do |format|
      if @telco.save
        format.html { redirect_to @telco, notice: 'Telco was successfully created.' }
        format.json { render json: @telco, status: :created, location: @telco }
      else
        format.html { render action: "new" }
        format.json { render json: @telco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /telcos/1
  # PUT /telcos/1.json
  def update
    @telco = Telco.find(params[:id])

    respond_to do |format|
      if @telco.update_attributes(params[:telco])
        format.html { redirect_to @telco, notice: 'Telco was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @telco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telcos/1
  # DELETE /telcos/1.json
  def destroy
    @telco = Telco.find(params[:id])
    @telco.destroy

    respond_to do |format|
      format.html { redirect_to telcos_url }
      format.json { head :no_content }
    end
  end
end
