
define cp_resume = 
resume_dir="$HOME/resume $HOME/jorb/resume"
resume_found=false
for dir in $resume_dir; do
	resume_path=${dir}/resume.pdf
	if [ -f $resume_path ]; then
		cp $resume_path assets/resume.pdf
		echo "\n  Copied resume from" $resume_path "into" $(pwd)/assets/resume.pdf "\n"
		resume_found=true
	fi
done

if ! $resume_found; then
	echo "Could't find resume.pdf in any of:" $resume_dir
	exit 2
fi
endef

default: copy_resume

copy_resume:
	$(value cp_resume)

# Allows cp_resume to run in a single shell, rather than
# using a separate shell for each line of the script
.ONESHELL: