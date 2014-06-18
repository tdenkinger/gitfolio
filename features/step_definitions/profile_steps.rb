Given(/^a user "(.*)"$/) do | user |
  @user = user
end

When(/^that user goes to her profile page$/) do
  visit("repos/#{@user}")
end

Then(/^she will see "(.*)"$/) do | repo_header |
  expect(page).to have_content(repo_header)
end
