set -e
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
hugo
cd public
git remote set-url origin https://github.com/sun-xiaoxu/sun-xiaoxu.github.io.git
git add .


msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# 推送到sun-xiaoxu.github.io仓库中
git push origin master