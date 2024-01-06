#!/bin/bash

# hashbang above seems to be important, because on some instance, the default interpreter is python
# see https://stackoverflow.com/a/69225044/7069108

# shutdown in 50 seconds
SHUTTING_DOWN_TIMEOUT_DURATION=${shutdown_duration_in_seconds}
SECONDS_TO_START_COUNTING_BEFORE_DUE_TIME=${seconds_to_start_counting_down_before_due_time}

sudo wall "starting automatic_turn_off_script.sh"



if (( SHUTTING_DOWN_TIMEOUT_DURATION > SECONDS_TO_START_COUNTING_BEFORE_DUE_TIME )); then
  remaining_time=$(expr $SHUTTING_DOWN_TIMEOUT_DURATION - $SECONDS_TO_START_COUNTING_BEFORE_DUE_TIME);
  sleep $remaining_time;
  SHUTTING_DOWN_TIMEOUT_DURATION=$SECONDS_TO_START_COUNTING_BEFORE_DUE_TIME;
fi

LOOPINCREMENT=${counting_down_increment}
while  [ $SHUTTING_DOWN_TIMEOUT_DURATION -gt 0 ];
do
  sudo wall "sudo wall shutting down in $SHUTTING_DOWN_TIMEOUT_DURATION seconds, configured by your terraform script";
  SHUTTING_DOWN_TIMEOUT_DURATION=$(expr $SHUTTING_DOWN_TIMEOUT_DURATION - $LOOPINCREMENT)
  sleep $LOOPINCREMENT
done

sudo wall "Shutting down"
sudo shutdown -h now

