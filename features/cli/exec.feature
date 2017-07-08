Feature: Converting recycle output into something that shells understand
  As a CLI user
  I want to be able to read entries easily to my configuration and inject them
  into my shell. I can do so by executing the the exec recycle command.

  Background:
    And there is a recycle configuration with contents
    """
    ---
    commands:
      du: du -sh
      l: ls -ltr
    directories:
      awesomesauce: /everything/is/awesome
      blog: /Source/jeremywrowe/blog
    """

  Scenario: Attempting to remove something without a prefix
    Given the recycle command is ran with 'exec'
    Then the command exit status should be '0'
    And the command output should be
    """
    alias awesomesauce="cd /everything/is/awesome"
    alias blog="cd /Source/jeremywrowe/blog"
    function du() {
      du -sh
    }
    function l() {
      ls -ltr
    }
    """
