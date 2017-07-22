Then(/^the cache file is written with contents$/) do |data|
  expected = <<~DOC
    You can now source #{cache_path} instead of using eval.
    
    Note: You'll have to rerun 'recycle cache' after you add configuration.
  DOC
  assert_match expected, @output
  assert_equal data.strip, File.read(cache_path).strip
end

