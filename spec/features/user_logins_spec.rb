require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    User.create!(
      name:  "New Guy",
      email: "new@guy.com",
      password: "testing",
      password_confirmation: "testing"
    )
  end

  scenario "They can submit login information for an existing user and be redirected to the homepage" do
    # ACT
    visit new_sessions_path
    fill_in 'email', with: 'new@guy.com'
    fill_in 'password', with: 'testing'
    click_on 'Submit'

    # DEBUG
    sleep 3
    save_screenshot

    # VERIFY
    expect(page).to have_content('Signed in as New Guy')
  end

  scenario "They are redirected to login form again if they submit incorrect login information" do
    # ACT
    visit new_sessions_path
    fill_in 'email', with: 'new@guy.com'
    fill_in 'password', with: 'wrong'
    click_on 'Submit'

    # DEBUG
    sleep 3
    save_screenshot

    # VERIFY
    expect(page).to have_content('Signup')
  end

end

# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end