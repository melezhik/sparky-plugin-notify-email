use v6;

unit module Sparky::Plugin::Notify::Email;

our sub run ( %ctx, %parameters ) {

  say "project: " ~ ( %ctx<project> );
  say "build-state: " ~ ( %ctx<build-state> );
  if %parameters<offline> {
    say "don't send notification, we are in offline mode ..."
  } else {
    shell("echo 'Sparky %ctx<project>\@%ctx<build-id> build completed. State: @%ctx<build-state>' | mail -s '%ctx<project>\@%ctx<build-id>  %parameters<to>' ");
  }
}


