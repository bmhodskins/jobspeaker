require "application_system_test_case"

class Api::V1::EventsTest < ApplicationSystemTestCase
  setup do
    @api_v1_event = api_v1_events(:one)
  end

  test "visiting the index" do
    visit api_v1_events_url
    assert_selector "h1", text: "Api/V1/Events"
  end

  test "creating a Event" do
    visit api_v1_events_url
    click_on "New Api/V1/Event"

    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit api_v1_events_url
    click_on "Edit", match: :first

    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit api_v1_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
