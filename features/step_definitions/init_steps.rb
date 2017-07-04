Then(/^the recycle configuration directory is setup$/) do
  assert File.exist?(File.join(tmp_dir, '.recycle')), 
    'the folder ".recycle" didnt exist and it should have'
end
