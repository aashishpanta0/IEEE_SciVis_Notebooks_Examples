#!/bin/bash
# This script sets up Git hooks for the repository

cat << 'EOF' > .git/hooks/pre-push
#!/bin/bash
protected_branch='main'
current_branch=$(git symbolic-ref --short HEAD)

if [ "$current_branch" = "$protected_branch" ]; then
  echo "You can't push to the $protected_branch branch from Codespaces. Please contact the repo owner or Aashish Panta (aashishpanta0@gmail.com). Thank you!"
  exit 1
fi
EOF

chmod +x .git/hooks/pre-push
