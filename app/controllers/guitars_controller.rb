class GuitarsController < ApplicationController
  # GET /guitars
  # GET /guitars.json
  def index
    @guitars = Guitar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guitars }
    end
  end

  # GET /guitars/1
  # GET /guitars/1.json
  def show
    @guitar = Guitar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guitar }
    end
  end

  # GET /guitars/new
  # GET /guitars/new.json
  def new
    @guitar = Guitar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guitar }
    end
  end

  # GET /guitars/1/edit
  def edit
    @guitar = Guitar.find(params[:id])
  end

  # POST /guitars
  # POST /guitars.json
  def create
    @guitar = Guitar.new(guitar_params)

    respond_to do |format|
      if @guitar.save
        format.html { redirect_to @guitar, notice: 'Guitar was successfully created.' }
        format.json { render json: @guitar, status: :created, location: @guitar }
      else
        format.html { render action: "new" }
        format.json { render json: @guitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guitars/1
  # PATCH/PUT /guitars/1.json
  def update
    @guitar = Guitar.find(params[:id])

    respond_to do |format|
      if @guitar.update_attributes(guitar_params)
        format.html { redirect_to @guitar, notice: 'Guitar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guitars/1
  # DELETE /guitars/1.json
  def destroy
    @guitar = Guitar.find(params[:id])
    @guitar.destroy

    respond_to do |format|
      format.html { redirect_to guitars_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example: params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def guitar_params
      params.require(:guitar).permit(:model, :year)
    end
end
