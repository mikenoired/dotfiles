up() {
  local d=""
  local limit="$1"
  for ((i=1 ; i <= limit ; i++)); do
    d="../$d"
  done
  cd "$d"
}