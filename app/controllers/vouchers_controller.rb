class VouchersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_voucher, only: [:show, :edit, :update, :destroy]

  # GET /vouchers
  # GET /vouchers.json
  def index
    @vouchers = Voucher.all
  end

  # GET /vouchers/1
  # GET /vouchers/1.json
  def show
  end

  # GET /vouchers/new
  def new
    @voucher = Voucher.new
  end

  # GET /vouchers/1/edit
  def edit
  end

  # POST /vouchers
  # POST /vouchers.json
  def create
    restaurant = Restaurant.find_by(address: params["voucher"][:restaurant])
    restaurant = create_restaurant(params["voucher"][:restaurant]) if restaurant.nil?

    @voucher = Voucher.new(voucher_params)
    @voucher[:restaurant_id] = restaurant.id
    @voucher[:user_id] = current_user.id

    respond_to do |format|
      if @voucher.save
        format.html { redirect_to @voucher, notice: 'Voucher was successfully created.' }
        format.json { render :show, status: :created, location: @voucher }
      else
        format.html { render :new }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vouchers/1
  # PATCH/PUT /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to @voucher, notice: 'Voucher was successfully updated.' }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1
  # DELETE /vouchers/1.json
  def destroy
    @voucher.destroy
    respond_to do |format|
      format.html { redirect_to vouchers_url, notice: 'Voucher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_restaurant(params)
    split_params = params.split(",")
    clean_array = split_params.collect{|x| x.strip || x }
    name = clean_array[0]
    address = params
    city = clean_array[-2]
    country = clean_array[-1]
    restaurant = Restaurant.new(name: name, address: address, city: city, country: country)
    restaurant.save
    return restaurant
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def voucher_params
    params.require(:voucher).permit(:name, :price, :notes, :restaurant_id)
  end
end
