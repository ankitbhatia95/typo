Given /the following users exist/ do |u_table|
	u_table.hashes.each do |item|
		User.create(item)
	end
end

Given /the following articles exist/ do |a_table|
	a_table.hashes.each do |item|
		Article.create(item)
	end
end