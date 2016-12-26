REBOL[
	Title:   "REBOL Network Setup"
]

set-user: func [
	"Create a default user.r preferences file."
	/local ask-it questions
][
	system/user/email:
	system/schemes/default/host:
	system/schemes/default/proxy/host:
	system/schemes/default/proxy/port-id:
	system/schemes/default/proxy/type: none

	;-- Use Query Dialect:
	questions: [
		{REBOL Network Setup

		Some network functions, such as sending email or
		using anonymous FTP, require you to provide an email
		address.  (Or, you just press ENTER to skip it.)
		
		Email address?} [
			either empty? answer [questions: skip questions 2][
				system/user/email: to-email answer]
		]
		{
		To send email you also need to provide the name of
		your email server (such as mail.domain.com). If you
		don't know it, check the configuration of your email
		program or ask your network administrator.
		
		Email server name?} [system/schemes/default/host: answer]
		{
		REBOL can connect directly to the Internet or through a
		proxy server.  If it's a direct connection, just press
		ENTER.  To set the proxy settings, you will need the
		proxy server's host name, TCP/IP port number, and proxy
		type.  Ask your network administrator if necessary.

		Do you require a proxy server?}
		{
		What is the host name of your proxy server? }
			[system/schemes/default/proxy/host: answer]
		{
		What is the TCP/IP port number used to connect to
		your proxy server?} 
			[system/schemes/default/proxy/port-id: to-integer answer]
		{
		Type the number of the proxy type you are using:
			1 - SOCKS version 5
			2 - SOCKS version 4
			3 - GENERIC (CERN)

		Which number?} [
			if none? system/schemes/default/proxy/type:
				pick [socks socks4 generic] to-integer answer
					[barf-here]
		]
		{
		Would you like to verify your network settings by
		sending a test email message to REBOL.com? If it
		fails with an error, your settings are not correct
		or your system is not connected to the Internet.

		Send a test message?} [
			either find/match answer "y" [
				print "Sending message now..."
				send luke@rebol.com "Testing!"
				print "Message was sent."
			][
				print "Okay. You can try email out later."
			]
		]
	]

	ask-it: [answer: ask append insert trim questions/1 newline " "]
	until [
		do ask-it
		tail? either block? questions/2 [
			while [error? try questions/2] ask-it
			questions: skip questions 2
		][
			questions: either find/match answer "y" [next questions][
				tail questions]
		]
	]
	
	if any [
		not exists? %user.r 
		confirm "^/Overwrite the current user.r file? "
	][
		print "^/Creating user.r file in current directory.^/"
		write %user.r trim reform [{
			REBOL [
			    Title: "User Preferences"
			    Date: } now {
			]

			set-net [}
				system/user/email
				system/schemes/default/host
				none
				system/schemes/default/proxy/host
				system/schemes/default/proxy/port-id
				system/schemes/default/proxy/type
			{]
			}
		]
		print trim {
			To change these settings, type "set-user" at the
			prompt or edit your user.r file.
		}
	]
	exit
]

set-user


