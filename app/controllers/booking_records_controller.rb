class BookingRecordsController < ApplicationController
  before_action :set_booking_record, only: [:show, :edit, :update, :destroy]

  # GET /booking_records
  # GET /booking_records.json
  def index
    @booking_records = BookingRecord.all
  end

  # GET /booking_records/1
  # GET /booking_records/1.json
  def show
  end

  # GET /booking_records/new
  def new
    @booking_record = BookingRecord.new
  end

  # GET /booking_records/1/edit
  def edit
  end

  # POST /booking_records
  # POST /booking_records.json
  def create
    @booking_record = BookingRecord.new(booking_record_params)

    respond_to do |format|
      if @booking_record.save
        format.html { redirect_to @booking_record, notice: 'Booking record was successfully created.' }
        format.json { render :show, status: :created, location: @booking_record }
      else
        format.html { render :new }
        format.json { render json: @booking_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_records/1
  # PATCH/PUT /booking_records/1.json
  def update
    respond_to do |format|
      if @booking_record.update(booking_record_params)
        format.html { redirect_to @booking_record, notice: 'Booking record was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_record }
      else
        format.html { render :edit }
        format.json { render json: @booking_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_records/1
  # DELETE /booking_records/1.json
  def destroy
    @booking_record.destroy
    respond_to do |format|
      format.html { redirect_to booking_records_url, notice: 'Booking record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_record
      @booking_record = BookingRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_record_params
      params.require(:booking_record).permit(:name, :description)
    end
end
