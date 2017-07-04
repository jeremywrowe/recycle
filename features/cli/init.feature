Feature: Setting up recycle
  Recycle must be setup before you can run commands. To do
  that you must run `recycle init` first.

Scenario: Running init for the first time
  Given the recycle command is ran with 'init'
  Then the command exit status should be '0'
  And the recycle configuration directory is setup
