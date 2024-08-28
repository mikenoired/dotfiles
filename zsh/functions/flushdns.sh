flushdns() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sudo killall -HUP mDNSResponder
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo systemd-resolve --flush-caches
  fi
}
