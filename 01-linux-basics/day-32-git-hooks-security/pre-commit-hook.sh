for file in $(git diff --cached --name-only); do
case "$file" in
*.env)
echo "Commit blocked: .env files must not be committed: $file"
exit 1
;;
esac
if [ -f "$file" ]; then
if grep -qE "password=|token=|secret=|password:|token:|secret:" "$file"; then
echo "Commit blocked: cannot commit a file with possible secrets: $file"
exit 1
fi
fi
done
