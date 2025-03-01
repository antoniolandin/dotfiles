#!/bin/sh

bluetooth_print() {

  bluetoothctl | while read -r; do
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ] && bluetoothctl show | grep -e '^.Powered: yes' > /dev/null; then

      devices_paired=$(bluetoothctl devices | cut -d ' ' -f 2)

      for device in $devices_paired; do
        device_info=$(bluetoothctl info "$device")

        if echo "$device_info" | grep -e '^.Connected: yes' > /dev/null; then
          device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
          output="%{F#81A1C1}󰂯 %{F-}$device_alias"
          break
        else
          output="%{F#81A1C1}󰂯"
        fi
      done
    else
      output="%{F#808B96}󰂲 "
    fi

    if ! [[ -n $last_output ]]; then
      echo $output
      last_output=$output
    elif [[ "$last_output" != "$output" ]]; then
      echo $output
      last_output=$output
    fi

  done
}

bluetooth_toggle() {
  if bluetoothctl show | grep -e '^.Powered: no' > /dev/null; then
    bluetoothctl power on >> /dev/null
    sleep 1

    devices_paired=$(bluetoothctl devices | cut -d ' ' -f 2)
    echo "$devices_paired" | while read -r line; do
      bluetoothctl connect "$line" >> /dev/null
    done
  else
    devices_paired=$(bluetoothctl devices | cut -d ' ' -f 2)
    echo "$devices_paired" | while read -r line; do
      bluetoothctl disconnect "$line" >> /dev/null
    done

    bluetoothctl power off >> /dev/null
  fi
}

case "$1" in
  --toggle)
    bluetooth_toggle
    ;;
  *)
    bluetooth_print
    ;;
esac
