extensions=$(cat ./extensions.txt)

for extension in $extensions; do
    code --install-extension $extension
done
