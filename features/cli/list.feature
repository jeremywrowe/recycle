Feature: Listing out items in the recycle configuration
  As a CLI user
  I want folks to be able to look at their configuration easily.
  They can do so by listing all (default arguments) or can filter
  on types with -c (--commands) and -d (--directories)
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
    And the command output should be
      """
      Commands
      ================================================================================

      l  => ls -ltr
      du => du -sh

      Directories
      ================================================================================

      blog         => /Source/jeremywrowe/blog
      awesomesauce => /everything/is/awesome
      """
