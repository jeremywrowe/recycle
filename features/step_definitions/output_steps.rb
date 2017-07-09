Given /^the command output has the header "(.*)" followed by$/ do |header, output|
  divider  = "=" * 80
  header   = header.center(80).rstrip
  expected = <<~EXPECTED
    #{divider}
    #{header}
    #{divider}

    #{output}
  EXPECTED

  assert_match expected, @output, "expected:\n'#{expected}'\nactual:\n'#{@output}'"
end
