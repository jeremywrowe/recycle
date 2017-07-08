guard :minitest do
  watch('exe/recycle') { 'test' }
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }
end

guard 'cucumber' do
  watch('exe/recycle') { 'features' }
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$}) { 'features' }

  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'features'
  end
end
