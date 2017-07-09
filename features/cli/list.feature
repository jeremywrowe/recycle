Feature: Listing out items in the recycle configuration
  As a CLI user
  I want to be able to look at my configuration easily.
  I can do so by either listing all (default arguments) or can filter
  on types with -c (--cmd) and -d (--dir)
  flags.

  Background:
    And there is a recycle configuration with contents
    """
    ---
    commands:
      l: ls -ltr
      du: du -sh
    directories:
      blog: /Source/jeremywrowe/blog
      awesomesauce: /everything/is/awesome
    """

  Scenario: Listing all entries with the list command
    Given the recycle command is ran with 'list'
    Then the command exit status should be '0'
    And the command output has the header "Commands" followed by
    """
    du => du -sh
    l  => ls -ltr
    """
    And the command output has the header "Directories" followed by
    """
    awesomesauce => /everything/is/awesome
    blog         => /Source/jeremywrowe/blog
    """

  Scenario: Listing directory entries with the list command
    Given the recycle command is ran with 'list -d'
    Then the command exit status should be '0'
    And the command output has the header "Directories" followed by
    """
    awesomesauce => /everything/is/awesome
    blog         => /Source/jeremywrowe/blog
    """

  Scenario: Listing directory entries with the list command
    Given the recycle command is ran with 'list -c'
    Then the command exit status should be '0'
    And the command output has the header "Commands" followed by
    """
    du => du -sh
    l  => ls -ltr
    """
