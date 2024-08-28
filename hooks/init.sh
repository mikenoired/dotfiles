init() {
  if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" || "$1" == "-H" ]]; then
    echo "Usage: init <type-of-file>"
    echo "Available files: .editorconfig, .gitignore, .prettierrc, pre-commit"
    return 1
  fi

  src_file="$HOME/dotfiles/hooks/init/$1"
  dest_file="./$1"

  if [ ! -f "$src_file" ]; then
    echo "🔴 File $src_file not found"
    return 1
  fi

  if [ -f "$dest_file" ]; then
    echo "🟠 File $dest_file already exists"
    return 1
  fi

  cp "$src_file" "$dest_file"
  echo "✅ File $dest_file created successfully"
}