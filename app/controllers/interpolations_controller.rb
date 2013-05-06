class InterpolationsController < ApplicationController
  # GET /interpolations
  # GET /interpolations.json
  def index
    @interpolations = Interpolation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interpolations }
    end
  end

  # GET /interpolations/1
  # GET /interpolations/1.json
  def show
    @interpolation = Interpolation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interpolation }
    end
  end

  # GET /interpolations/new
  # GET /interpolations/new.json
  def new
    if !current_user
      flash[:notice] = "You must sign in or register to do this."
      redirect_to new_user_path
    else
    @interpolation = Interpolation.new
    @interpolation.changes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interpolation }
    end
  end
  end

  # GET /interpolations/1/edit
  def edit
    @interpolation = Interpolation.find(params[:id])
    if current_user != @interpolation.user
      flash[:notice] = "You can't edit this."
      redirect_to interpolation_path(@interpolation)
    end
  end

  # POST /interpolations
  # POST /interpolations.json
  def create
    @interpolation = Interpolation.new(params[:interpolation])

    @interpolation.user_id = current_user.id

    respond_to do |format|
      if @interpolation.save
        format.html { redirect_to @interpolation, notice: 'Interpolation was successfully created.' }
        format.json { render json: @interpolation, status: :created, location: @interpolation }
      else
        format.html { render action: "new" }
        format.json { render json: @interpolation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interpolations/1
  # PUT /interpolations/1.json
  def update
    @interpolation = Interpolation.find(params[:id])

    respond_to do |format|
      if @interpolation.update_attributes(params[:interpolation])
        format.html { redirect_to @interpolation, notice: 'Interpolation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interpolation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interpolations/1
  # DELETE /interpolations/1.json
  def destroy
    @interpolation = Interpolation.find(params[:id])
    if current_user != @interpolation.user
      flash[:notice] = "You can't do this."
      redirect_to interpolation_path(@interpolation)
    end
    @interpolation.destroy

    respond_to do |format|
      format.html { redirect_to interpolations_url }
      format.json { head :no_content }
    end
  end

  def rate
    @interpolation = Interpolation.find(params[:id])
    @interpolation.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @interpolation.wrapper_dom_id(params), ratings_for(@interpolation, params.merge(:wrap => false))
      page.visual_effect :highlight, @interpolation.wrapper_dom_id(params)
    end
  end
end
