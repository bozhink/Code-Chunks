#!/usr/bin/ksh
# shell script "menu_scr"
PS3="Enter the selected number:"
select answer in \
	"Send." \
	"Recieve." \
	"Exit."
do
	case $answer in
		"Send.")
			print -n "Insert e_mail address:"
			read addr
			mail $addr ;;
		"Recieve.")
			mail ;;
		"Exit.")
			exit ;;
*) print "Error. Illegal number: $REPLY"
	esac
done
