#!/usr/bin/env bats

@test "process nrpe should be running" {
    run pgrep nrpe
    [ "$status" -eq 0 ]
    [[ "$output" != "" ]]
}

