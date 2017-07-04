Given(/^the recycle command is ran with '(.+)'$/) do |args|
  executable = File.join(root_dir, 'exe/recycle')
  @output = `RECYCLE_ROOT="#{tmp_dir}" #{executable} #{args}`
end

Given(/^there is a recycle configuration with contents$/) do |contents|
  FileUtils.mkdir_p File.join(tmp_dir, '.recycle')
  File.open(File.join(tmp_dir, '.recycle', 'data.yml'), 'w') do |file|
    contents.each_line {|line| file.write(line) }
  end
end

Then(/^the command exit status should be '(\d+)'$/) do |expected_status|
  actual_status = $?.exitstatus
  assert actual_status == expected_status.to_i,
    "the exit status was '#{actual_status}' and should have been '#{expected_status}'."
end

Then(/^the command output should be$/) do |output|
  assert_equal @output.strip, output.strip,
    'the command did not produce the correct output'
end

