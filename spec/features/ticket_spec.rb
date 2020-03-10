require "rails_helper"

RSpec.describe "Ticket Page", :type => :feature do

  before :all do
    @user = create(:user)
    @userx = create(:userx)
    @agent = create(:agent)
    @ticket = create(:ticket, user_id: @user.id)
    @ticket2 = create(:ticket, user_id: @userx.id)
  end

  # before(:each) do
  #   visit("/users/sign_in")
  #   fill_in "user[email]", with: @user.email
  #   fill_in "user[password]", with: @user.password
  #   click_button "Log in"
  # end

  # after(:all) do
  #   find(".user-nav__user").click
  #   find(".navbar-link").click
  #   puts "after all"
  # end

  feature "User view request page" do
    before(:each) do
      visit("/users/sign_in")
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "Log in"
    end

    scenario "expect user to see all their tickets" do
      visit("/tickets")
      expect(page).to have_text "My Requests"
      expect(page).to have_content "#{@ticket.title}"
      expect(page).to have_css(".ticket__listing")
    end

    scenario "expect user to see the details of a ticket" do
      visit("/tickets/#{@ticket.id}")
      expect(page).to have_css(".ticket-wrapper")
      expect(page).to have_content "#{@ticket.title}"
      expect(page).to have_content "#{@ticket.description}"
      expect(page).to have_content "#{@ticket.user.name}"
      
      # expect(page).to have_css(".comment-show-container")
      # expect(page).to have_content "Add to conversation..."
    end
  end

  feature "Agent/Admin view request page" do
    before(:each) do
      visit("/users/sign_in")
      fill_in "user[email]", with: @agent.email
      fill_in "user[password]", with: @agent.password
      click_button "Log in"
    end

    scenario "expect agent/admin to see all tickets created" do
      visit("/tickets")
      expect(page).to have_text "All Requests"
      expect(page).to have_content "#{@ticket.title}"
      expect(page).to have_css(".ticket__listing")
    end

    scenario "expect agent/admin to see the details of a ticket" do
      visit("/tickets/#{@ticket.id}")
      expect(page).to have_css(".ticket-wrapper")
      expect(page).to have_content "#{@ticket.title}"
      expect(page).to have_content "#{@ticket.description}"
      expect(page).to have_content "#{@ticket.user.name}"
      expect(page).to have_css(".comment-show-container")
      expect(page).to have_button "Submit"
    end
  end


end
