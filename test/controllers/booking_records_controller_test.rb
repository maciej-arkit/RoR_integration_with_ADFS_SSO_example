require 'test_helper'

class BookingRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_record = booking_records(:one)
  end

  test "should get index" do
    get booking_records_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_record_url
    assert_response :success
  end

  test "should create booking_record" do
    assert_difference('BookingRecord.count') do
      post booking_records_url, params: { booking_record: { description: @booking_record.description, name: @booking_record.name } }
    end

    assert_redirected_to booking_record_url(BookingRecord.last)
  end

  test "should show booking_record" do
    get booking_record_url(@booking_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_record_url(@booking_record)
    assert_response :success
  end

  test "should update booking_record" do
    patch booking_record_url(@booking_record), params: { booking_record: { description: @booking_record.description, name: @booking_record.name } }
    assert_redirected_to booking_record_url(@booking_record)
  end

  test "should destroy booking_record" do
    assert_difference('BookingRecord.count', -1) do
      delete booking_record_url(@booking_record)
    end

    assert_redirected_to booking_records_url
  end
end
