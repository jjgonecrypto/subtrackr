class SchemesController < ApplicationController
  # GET /schemes
  # GET /schemes.json
  def index
    @schemes = Scheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schemes }
    end
  end

  # GET /schemes/1
  # GET /schemes/1.json
  def show
    @scheme = Scheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scheme }
    end
  end

  # GET /schemes/new
  # GET /schemes/new.json
  def new
    @scheme = Scheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scheme }
    end
  end

  # GET /schemes/1/edit
  def edit
    @scheme = Scheme.find(params[:id])
  end

  # POST /schemes
  # POST /schemes.json
  def create
    @scheme = Scheme.new(params[:scheme])

    respond_to do |format|
      if @scheme.save
        format.html { redirect_to @scheme, notice: 'Scheme was successfully created.' }
        format.json { render json: @scheme, status: :created, location: @scheme }
      else
        format.html { render action: "new" }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schemes/1
  # PUT /schemes/1.json
  def update
    @scheme = Scheme.find(params[:id])

    respond_to do |format|
      if @scheme.update_attributes(params[:scheme])
        format.html { redirect_to @scheme, notice: 'Scheme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemes/1
  # DELETE /schemes/1.json
  def destroy
    @scheme = Scheme.find(params[:id])
    @scheme.destroy

    respond_to do |format|
      format.html { redirect_to schemes_url }
      format.json { head :ok }
    end
  end
end
