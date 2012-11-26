Given /^the following categories exist$/ do |table|
  table.hashes.each do |category|
    Category.create({:name => category[:name],
                     :permalink => category[:permalink],
                     :position => category[:position]})
  end
end
