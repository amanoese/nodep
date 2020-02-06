#!/usr/bin/env bats

@test "default case" {
  result="$(echo -n 'a=b' | ./exec.sh "require('querystring').parse" @ JSON.stringify )"
  echo "$result"
  [ "$result" = '{"a":"b"}' ]
}

@test "js parse to JSON" {
  result="$(echo -n '{a:1}' | sed 's/^/x=/' | ./exec.sh eval @ JSON.stringify )"

}
