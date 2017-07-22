Feature: Caching generated shell data to a file
  As a CLI user
  I want to be able to export a given configuration to
  .recylce/cache

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

  Scenario: 
    Given the recycle command is ran with 'cache'
    Then the command exit status should be '0'
    And the cache file is written with contents
    """
    alias blog="cd /Source/jeremywrowe/blog"
    alias awesomesauce="cd /everything/is/awesome"
    function l() {
      ls -ltr
    }
    function du() {
      du -sh
    }
    """
