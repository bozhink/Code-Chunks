void main(string[] args) {
	// Output the number of arguments
	stdout.printf("%d command line argument(s):\n",args.length);
	
	// Enumerate all command line arguments
	foreach (string arg in args) {
		stdout.printf("%s\n",arg);
	}
	
	string command;
	if (args.length == 2) {
		command = "ls " + args[1];
	} else if (args.length == 3) {
		command = "ls " + args[1] + " " + args[2];
	} else {
		command = "ls";
	}
	print("Command to be executed:\n\t\t%s\n",command);
	
	try {
		// Non-blocking
		Process.spawn_command_line_async(command);
		
		// Blocking (waits for the process to finish
		Process.spawn_command_line_sync("ls");
		
		// Blocking with output
		string standard_output, standard_error;
		int exit_status;
		Process.spawn_command_line_sync(command, out standard_output, out standard_error, out exit_status);
	} catch (SpawnError e) {
		stderr.printf("%s\n", e.message);
	}
}
