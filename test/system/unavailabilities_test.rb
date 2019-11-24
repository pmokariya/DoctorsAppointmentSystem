require "application_system_test_case"

class UnavailabilitiesTest < ApplicationSystemTestCase
  setup do
    @unavailability = unavailabilities(:one)
  end

  test "visiting the index" do
    visit unavailabilities_url
    assert_selector "h1", text: "Unavailabilities"
  end

  test "creating a Unavailability" do
    visit unavailabilities_url
    click_on "New Unavailability"

    click_on "Create Unavailability"

    assert_text "Unavailability was successfully created"
    click_on "Back"
  end

  test "updating a Unavailability" do
    visit unavailabilities_url
    click_on "Edit", match: :first

    click_on "Update Unavailability"

    assert_text "Unavailability was successfully updated"
    click_on "Back"
  end

  test "destroying a Unavailability" do
    visit unavailabilities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unavailability was successfully destroyed"
  end
end
