require "application_system_test_case"

class DevelopmentsTest < ApplicationSystemTestCase
  setup do
    @development = developments(:one)
  end

  test "visiting the index" do
    visit developments_url
    assert_selector "h1", text: "Developments"
  end

  test "creating a Development" do
    visit developments_url
    click_on "New Development"

    fill_in "Description", with: @development.description
    fill_in "Keywords", with: @development.keywords
    fill_in "Name", with: @development.name
    fill_in "Significance general", with: @development.significance_general
    fill_in "Significance in sector", with: @development.significance_in_sector
    click_on "Create Development"

    assert_text "Development was successfully created"
    click_on "Back"
  end

  test "updating a Development" do
    visit developments_url
    click_on "Edit", match: :first

    fill_in "Description", with: @development.description
    fill_in "Keywords", with: @development.keywords
    fill_in "Name", with: @development.name
    fill_in "Significance general", with: @development.significance_general
    fill_in "Significance in sector", with: @development.significance_in_sector
    click_on "Update Development"

    assert_text "Development was successfully updated"
    click_on "Back"
  end

  test "destroying a Development" do
    visit developments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Development was successfully destroyed"
  end
end
