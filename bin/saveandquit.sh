saveandquit() {
	git add .;
	echo "comment on commits";
	read -r message;
	git commit -m "$message";
	git push origin main
}

saveandquit

