# -------------------------------- #
# Add code to the `.bashrc` file.

## Run ssh agent to authorize adding keys | stdout silenced (>/dev/null)
eval `ssh-agent` >/dev/null

echo -e "\n#--------  Choose  User  ---------#\n"

list="$(find ~/.ssh -type f)"
for file in $list; do
        # Depending on file length, or if you want to go through the trouble of
        # making the file variable a relative path, opposed to an absolute one, 
        # you'll need to edit where the string gets sliced (line 15 of this file) 
        # and potentially add in code to do it for you.
        begin="${file:0:10}"
        if [[ "${begin}" = "~/.ssh/id_" ]]; then
                end="${file:${#file}-4}"
                # There may be an even more efficient way of capturing `OR` (||) in `bash` and `sh`
                # but you could add any number of conditionals to fit personal needs.
                if [[ "${end}" != ".pub" ]] || [[ $end != "_rsa" ]]; then
                        # If we ever get too many ssh-keys, we can capture a success and break.
                        # Errors are also silenced (2>/dev/null)
                        ssh-add $file 2>/dev/null
                fi;
        fi;
done

echo -e "\n#-------- Authentication ---------#\n"
# Authentication is really just a ssh test ran to hit GitHub's server
# and check if our key is authenticated. Luckily, this also returns
# an informative message that logs what user we currently are. 
ssh -T git@github.com

# -------------------------------- #
