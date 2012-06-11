Given /^I have a simple universe$/ do
  visit '/bigbang'
end

When /^I am viewing the starting sector$/ do
  visit "/"
end

Then /^the sector number is (\d+)$/ do |sector|
  page.should have_content("\"sector\":#{sector}")
end

Then /^it has warps that lead to sectors$/ do |table|
  pending
end

