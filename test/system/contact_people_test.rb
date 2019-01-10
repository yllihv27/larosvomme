require "application_system_test_case"

class ContactPeopleTest < ApplicationSystemTestCase
  setup do
    @contact_person = contact_people(:one)
  end

  test "visiting the index" do
    visit contact_people_url
    assert_selector "h1", text: "Contact People"
  end

  test "creating a Contact person" do
    visit contact_people_url
    click_on "New Contact Person"

    fill_in "Child", with: @contact_person.child_id
    fill_in "Course", with: @contact_person.course_id
    fill_in "First name", with: @contact_person.first_name
    fill_in "Last name", with: @contact_person.last_name
    fill_in "Member", with: @contact_person.member_id
    fill_in "Order", with: @contact_person.order_id
    fill_in "Participation", with: @contact_person.participation_id
    fill_in "Phone", with: @contact_person.phone
    click_on "Create Contact person"

    assert_text "Contact person was successfully created"
    click_on "Back"
  end

  test "updating a Contact person" do
    visit contact_people_url
    click_on "Edit", match: :first

    fill_in "Child", with: @contact_person.child_id
    fill_in "Course", with: @contact_person.course_id
    fill_in "First name", with: @contact_person.first_name
    fill_in "Last name", with: @contact_person.last_name
    fill_in "Member", with: @contact_person.member_id
    fill_in "Order", with: @contact_person.order_id
    fill_in "Participation", with: @contact_person.participation_id
    fill_in "Phone", with: @contact_person.phone
    click_on "Update Contact person"

    assert_text "Contact person was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact person" do
    visit contact_people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact person was successfully destroyed"
  end
end
