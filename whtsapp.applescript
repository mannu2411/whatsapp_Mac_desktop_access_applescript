		
tell application "System Events"
    set activeApp to name of first application process whose frontmost is true     
    if (get name of every application process) contains "WhatsApp" then
    	set flag to "true"
    else
		set flag to "false"
    end if
	set listOfShows to ""
	set Shows to paragraphs of (read POSIX file "/Users/manubhavjain/Downloads/message.txt")
	set listOfUsers to ""
	set Heres to paragraphs of (read POSIX file "/Users/manubhavjain/Downloads/users.txt")
    tell application "Whatsapp"
		reopen
        activate
    end tell
	if flag is equal to "false" then			
		delay 12
    end if
	repeat with i from 1 to count of Heres
		set next to item i of Heres
		tell application "System Events"
    		set frontmostProcess to first process where it is frontmost
    		set appName to name of frontmostProcess
	  	end tell      
	  	if "Whatsapp" is in appName then
			key code 48
			delay 1
			set listOfUsers to ""
			if length of next is greater than 0 then 
				copy next to listOfUsers
				if listOfUsers = ";" then
					return
				end if
				end if
				keystroke listOfUsers
			delay 3
			key code 48
			key code 48
			key code 48
			
			repeat with nextLine in Shows
				set listOfShows to ""
				tell application "System Events"
    				set frontmostProcess to first process where it is frontmost
    				set appName to name of frontmostProcess
	  			end tell     
	  			if "Whatsapp" is in appName then
					if length of nextLine is greater than 0 and nextLine is not equal to ";" then
        				copy nextLine to listOfShows
						if listOfShows = ";" then
							return
						end if
    				end if	
	  				keystroke listOfShows
	  				key code 36
	  				delay 1
	  			else
					exit repeat
	    		end if
			end repeat
		else
			exit repeat
		end if		
	end repeat
end tell