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

  Scenario: Adding a command entry
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

  Scenario: Adding a diretory entry
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
