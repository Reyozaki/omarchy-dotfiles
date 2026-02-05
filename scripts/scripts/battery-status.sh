#!/bin/bash

# Retrieve battery data using upower, BAT selects the battery module, isolate specific row and value in the second column with awk

# Battery percentage
level=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | head -c -2)

# Battery state, i.e. charging or discharging
status=$(upower -i $(upower -e | grep 'BAT') | grep -E "state" | awk '{print $2}')

# Status and level based battery icon display
if [[ "$status" == "discharging" ]]; then
  if [[ ("$level" -ge "0") && ("$level" -le "10") ]]; then
    printf "󰁺 %s%%" "$level"
  elif [[ ("$level" -ge "10") && ("$level" -le "20") ]]; then
    printf "󰁻 %s%%" "$level"
  elif [[ ("$level" -ge "20") && ("$level" -le "30") ]]; then
    printf "󰁼 %s%%" "$level"
  elif [[ ("$level" -ge "30") && ("$level" -le "40") ]]; then
    printf "󰁽 %s%%" "$level"
  elif [[ ("$level" -ge "40") && ("$level" -le "50") ]]; then
    printf "󰁾 %s%%" "$level"
  elif [[ ("$level" -ge "50") && ("$level" -le "60") ]]; then
    printf "󰁿 %s%%" "$level"
  elif [[ ("$level" -ge "60") && ("$level" -le "70") ]]; then
    printf "󰂀 %s%%" "$level"
  elif [[ ("$level" -ge "70") && ("$level" -le "80") ]]; then
    printf "󰂁 %s%%" "$level"
  elif [[ ("$level" -ge "80") && ("$level" -le "90") ]]; then
    printf "󰂂 %s%%" "$level"
  elif [[ ("$level" -ge "90") && ("$level" -le "100") ]]; then
    printf "󰁹 %s%%" "$level"
  fi
elif [[ "$status" == "charging" ]]; then
  if [[ ("$level" -ge "0") && ("$level" -le "10") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "10") && ("$level" -le "20") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "20") && ("$level" -le "30") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "30") && ("$level" -le "40") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "40") && ("$level" -le "50") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "50") && ("$level" -le "60") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "60") && ("$level" -le "70") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "70") && ("$level" -le "80") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "80") && ("$level" -le "90") ]]; then
    printf "🗲 %s%%" "$level"
  elif [[ ("$level" -ge "90") && ("$level" -le "100") ]]; then
    printf "🗲 %s%%" "$level"
  fi
fi
