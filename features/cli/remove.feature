Feature: Listing out items in the recycle configuration
  As a CLI user
  I want to be able to remove entries easily from my configuration. I can
  do so by specifying either -c (--cmd) for commands or -d (--dir)
  for directories.

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
    Given the recycle command is ran with 'remove l'
    Then the command exit status should be '1'
    And the command output has the header "Usage" followed by
    """
      recycle remove -c IDENTIFIER - removes the command named IDENTIFIER
      recycle remove -d IDENTIFIER - removes the command named IDENTIFIER
    """

  Scenario: Removing a command entry
    Given the recycle command is ran with 'remove -c l'
    Then the command exit status should be '0'
    And the configuration should be
    """
    ---
    commands:
      du: du -sh
    directories:
      awesomesauce: /everything/is/awesome
      blog: /Source/jeremywrowe/blog
    """

  Scenario: Removing a diretory entry
    Given the recycle command is ran with 'remove -d awesomesauce'
    Then the command exit status should be '0'
    And the configuration should be
    """
    ---
    commands:
      l: ls -ltr
      du: du -sh
    directories:
      blog: /Source/jeremywrowe/blog
    """
