#Update script of UserBot by @marshmello61
#Some fixes by @RoyalBoy69
#Ported for Ultroid by ManOfDiamond

repo="Ultroid"
rm -rf ${repo}

echo "You're running the Ultroid:stable Updater script"
echo " "
# Get username of user
echo -n "Enter your GitHub username: "
read userName
echo " "

# Check if user has forked or has the same repo name
echo -n "Have you forked Ultroid from TeamUltroid or has the same repo name i.e. Ultroid? [y/n]: "
read fork
echo " "

if [[ "${fork}" == 'y' ]]; then
	git clone https://github.com/${userName}/${repo}.git --branch main
	cd ${repo}
elif [[ "${fork}" == 'n' ]]; then
	echo -n "Enter your repo name: "
	read repo
	git clone https://github.com/${userName}/${repo}.git --branch main
	cd ${repo}
else
        echo " "
        echo "You were only supposed to enter y or n :/"
        exit 1
fi

echo " "
echo "Updating your Ultroid"
git pull https://github.com/TeamUltroid/Ultroid.git --set-upstream main
git diff
git commit -m "script merge"
git push https://github.com/${userName}/${repo}.git
echo " "
echo "Updated"
cd ..
rm -rf ${repo}
