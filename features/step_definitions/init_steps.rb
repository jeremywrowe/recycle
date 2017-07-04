Given(/^the recycle command is ran with '(.+)'$/) do |args|
  executable = File.join(root_dir, 'exe/recycle')
  `RECYCLE_ROOT="#{tmp_dir}" #{executable} #{args}`
end

Then(/^the command exit status should be '(\d+)'$/) do |expected_status|
  actual_status = $?.exitstatus
  assert actual_status == expected_status.to_i,
    "the exit status was '#{actual_status}' and should have been '#{expected_status}'."
end

Then(/^the recycle configuration directory is setup$/) do
  assert File.exist?(File.join(tmp_dir, '.recycle')), 
    'the folder ".recycle" didnt exist and it should have'
end
