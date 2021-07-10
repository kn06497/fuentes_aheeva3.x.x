// JavaScript Document
/*******************************************************************
####################################################################
####################################################################
		LIST OF ASTERISK APPLICATIONS   ####################
####################################################################
####################################################################
*******************************************************************/
var ast_apps_list = new Array();
ast_apps_list[""] 	= "";
ast_apps_list["AbsoluteTimeout"] 	= "Set absolute maximum time of call";
//ast_apps_list["AddQueueMember"] 	= "Dynamically adds queue members";
//ast_apps_list["ADSIProg"] 		= "Load Asterisk ADSI Scripts into phone";
//ast_apps_list["AgentCallbackLogin"] 	= "Call agent callback login";
//ast_apps_list["AgentLogin"] 		= "Call agent login";
//ast_apps_list["AgentMonitorOutgoing"] 	= "Monitor Outgoing Agent Calls (0.7.3)";
ast_apps_list["AGI"] 			= "Executes an AGI compliant application";
//ast_apps_list["AlarmReceiver"] 	= "Emulate an Ademco Contact ID Alarm Receiver";
//ast_apps_list["ALSAMonitor"] 		= "Monitor the ALSA console";
ast_apps_list["Answer"] 		= "Answer a channel if ringing";
ast_apps_list["AppendCDRUserField"] 	= "Append data to the CDR user field";
ast_apps_list["Authenticate"] 		= "Authenticate a user";
ast_apps_list["BackGround"] 		= "Play a file while awaiting extension";
ast_apps_list["BackgroundDetect"] 	= "Background a file with talk detect";
ast_apps_list["Busy"] 			= "Indicate busy condition and wait for hangup";
//ast_apps_list["CallingPres"] 		= "Change the presentation for the callerid in a ZAP channel";
ast_apps_list["ChangeMonitor"] 	= "Change monitoring filename of a channel";
//ast_apps_list["ChanIsAvail"] 		= "Check if channel is available";
//ast_apps_list["ChanSpy"] 		= "Universal channel brarge-in";
//ast_apps_list["CheckGroup"] 		= "checks if the total # of channels exceeds max";
ast_apps_list["Congestion"] 		= "Indicate congestion and wait for hangup";
ast_apps_list["ControlPlayback"] 	= "Play a sound file with fast forward, rewind and exit controls";
//ast_apps_list["Curl"] 			= "Allows for the retrieval of external URLs. Also supports POSTing.";
ast_apps_list["Cut"] 			= "String handling function";
ast_apps_list["DateTime"] 		= "Say the date and/or time (Obsolete)";
//ast_apps_list["DBdel"] 		= "Delete a key from the database";
//ast_apps_list["DBdeltree"] 		= "Delete a family or keytree from the database";
//ast_apps_list["DBget"] 		= "Retrieve a value from the database";
//ast_apps_list["DBput"] 		= "Store a value in the database";
ast_apps_list["DeadAGI"] 		= "Executes AGI on a hungup channel";
ast_apps_list["Dial"] 			= "Place an call and connect to the current channel";
ast_apps_list["DigitTimeout"] 	= "Set maximum timeout between digits";
ast_apps_list["Directory"] 	= "Provide directory of voicemail extensions";
//ast_apps_list["DISA"] 			= "DISA (Direct Inward System Access)";
ast_apps_list["DTMFToText"] 	= "Enter alphanumeric strings with DTMF phone";
//ast_apps_list["DUNDiLookup"] 	= "Look up a number with DUNDi";
//ast_apps_list["EAGI"] 			= "Executes an AGI compliant application on local or remote machine (FastAGI)";
ast_apps_list["Echo"] 			= "Echo audio read back to the user";
//ast_apps_list["EnumLookup"] 	= "Lookup number in ENUM";
ast_apps_list["Eval"] 			= "Evaluate arguments before calling application";
ast_apps_list["Festival"] 		= "Say text with the Festival voice synthesizer";
//ast_apps_list["Flash"] 		= "Flashes a Zap Trunk";
//ast_apps_list["GetCPEID"] 		= "Get ADSI CPE ID";
//ast_apps_list["GetGroupCount"] = "group count for specified group or channel is in";
//ast_apps_list["GetGroupMatchCount"] 	= "Calculates group count for all groups that match pattern";
//ast_apps_list["Goto"] 			= "Goto a particular priority, extension, or context";
//ast_apps_list["GotoIf"] 		= "Conditional goto";
//ast_apps_list["GotoIfTime"] 		= "Conditional goto on current time";
ast_apps_list["Hangup"] 		= "Unconditional hangup";
//ast_apps_list["HasNewVoicemail"] 	= "Conditionally branches to priority + 101";
//ast_apps_list["HasVoicemail"] 		= "Conditionally branches to priority + 101";
//ast_apps_list["ICES"] 			= "Streaming calls to the Internet";
//ast_apps_list["ImportVar"] 		= "Set variable to value";
//ast_apps_list["LookupBlacklist"] 	= "Look up Caller*ID name/number from blacklist database";
//ast_apps_list["LookupCIDName"] 	= "Look up CallerID Name from local database";
//ast_apps_list["Macro"] 		= "Macro Implementation";
//ast_apps_list["MailboxExists"] 	= "Checks if voicemail mailbox exists";
//ast_apps_list["Math"] 			= "Perform (rather simple) calculations";
ast_apps_list["MeetMe"] 		= "Simple MeetMe conference bridge";
ast_apps_list["MeetMeAdmin"] 		= "MeetMe conference Administration";
ast_apps_list["MeetMeCount"] 		= "MeetMe participant count";
ast_apps_list["Milliwatt"] 		= "Generate a constant 1000Hz tone at 0dbm (mu-law)";
ast_apps_list["Monitor"] 		= "Record a telephone conversation to a sound file";
ast_apps_list["MP3Player"] 		= "Play an MP3 sound file or stream";
ast_apps_list["MusicOnHold"] 		= "Play Music On Hold indefinitely";
//ast_apps_list["MYSQL"] 		= "Perform various mySQL database activities";
//ast_apps_list["NBScat"] 		= "Play an NBS local stream";
ast_apps_list["NoCDR"] 		= "Make sure asterisk doesn't save CDR for a certain call";
ast_apps_list["NoOp"] 			= "No operation. Can print values to console for debugging.";
//ast_apps_list["ParkAndAnnounce"] 	= "Park and Announce";
//ast_apps_list["ParkedCall"] 		= "Answer a parked call";
//ast_apps_list["Perl"] 			= "res_perl is the mod_perl of Apache, only for Asterisk";
ast_apps_list["Playback"] 		= "Play a file";
ast_apps_list["Playtones"] 		= "Play a tone list while executing other commands";
//ast_apps_list["PPPD"] 			= "PPP daemon connector";
//ast_apps_list["Prefix"] 		= "Prepend leading digits";
ast_apps_list["PrivacyManager"] 	= "Require phone number to be entered, if no CallerID sent";
//ast_apps_list["Queue"] 		= "Queue a call for a call queue";
//ast_apps_list["Random"] 		= "Make a random jump in your dial plan";
//ast_apps_list["Read"] 			= "Read a variable";
ast_apps_list["Record"] 		= "Record a telephone conversation to a sound file";
//ast_apps_list["RemoveQueueMember"] 	= "Dynamically removes queue members";
ast_apps_list["ResetCDR"] 		= "Reset CDR data";
ast_apps_list["ResponseTimeout"] 	= "Set maximum timeout awaiting response";
ast_apps_list["Ringing"] 		= "Indicate ringing tone";
ast_apps_list["Rpt"] 			= "Support Amatuer Radio and Commercial Two Way Repeater Linking";
ast_apps_list["SayAlpha"] 		= "Say Alpha";
ast_apps_list["SayDigits"] 		= "Say Digits";
ast_apps_list["SayNumber"] 		= "Say Number";
ast_apps_list["SayPhonetic"] 		= "Say Phonetic";
ast_apps_list["SayUnixTime"] 		= "Say the date and/or time";
ast_apps_list["SendDTMF"] 		= "Sends arbitrary DTMF digits";
ast_apps_list["SendImage"] 		= "Send an image file";
ast_apps_list["SendText"] 		= "Send client a text message";
ast_apps_list["SendURL"] 		= "Send client a URL to display";
ast_apps_list["SetAccount"] 		= "Sets account code";
ast_apps_list["SetAMAflags"] 		= "Set the channel AMA Flags for billing";
ast_apps_list["SetCallerID"] 		= "Set CallerID";
ast_apps_list["SetCallerPres"]		= "Channel independent setting of caller presenation";
ast_apps_list["SetCDRUserField"] 	= "Set CDR User Field. See Billing.";
ast_apps_list["SetCIDName"] 		= "Set CallerID Name";
ast_apps_list["SetCIDNum"] 		= "Set only the Caller ID number (not name)";
//ast_apps_list["SetGlobalVar"] 		= "Set variable to value";
//ast_apps_list["SetGroup"] 		= "Sets the group name on the channel";
ast_apps_list["SetLanguage"] 		= "Change language setting for sound playback";
ast_apps_list["SetMusicOnHold"] 	= "Set default Music On Hold class";
ast_apps_list["SetVar"] 		= "Set variable to value";
//ast_apps_list["SIPGetHeader"] 		= "Pick any header from a SIP invite message";
//ast_apps_list["SIPdtmfMode"] 		= "Change DTMF mode during SIP call";
//ast_apps_list["SMS"] 			= "Send and receive SMS (short messaging service)";
ast_apps_list["SoftHangup"] 		= "Soft Hangup Application";
ast_apps_list["StopMonitor"] 		= "Stop monitoring a channel";
ast_apps_list["StopPlaytones"] 	= "Stop playing a tone list";
ast_apps_list["StripLSD"] 		= "Strip least significant digits";
ast_apps_list["StripMSD"] 		= "Strip leading digits";
ast_apps_list["SubString"] 		= "(Obsolete) Save substring digits in a given variable";
ast_apps_list["Suffix"] 		= "Append trailing digits";
ast_apps_list["System"] 		= "Execute a system command";
ast_apps_list["Transfer"] 		= "Transfer caller to remote extension";
//ast_apps_list["TrySystem"] 		= "Execute a system command with always 0 returned";
//ast_apps_list["TXTCIDName"] 		= "Lookup caller name from TXT record";
//ast_apps_list["UserEvent"] 		= "Send an arbitrary event to the manager interface";
ast_apps_list["VoiceMail"] 		= "Leave a voicemail message";
ast_apps_list["VoiceMail2"] 		= "(Obsolete) Leave a voicemail message";
ast_apps_list["VoiceMailMain"] 	= "Enter voicemail system";
ast_apps_list["VoiceMailMain2"] 	= "(Obsolete) Enter voicemail system";
ast_apps_list["Wait"] 			= "Waits for some time";
ast_apps_list["WaitExten"] 		= "Waits for some time";
ast_apps_list["WaitForRing"] 		= "Wait for Ring Application";
ast_apps_list["WaitMusicOnHold"] 	= "Wait, playing Music On Hold";
ast_apps_list["WaitSilence"] 	= "Wait for silence";
ast_apps_list["Zapateller"] 		= "Block telemarketers with SIT";
ast_apps_list["ZapBarge"] 		= "Barge in (monitor) Zap channel";
//ast_apps_list["ZapRAS"] 		= "Provide ISDN data service";
//ast_apps_list["ZapScan"] 		= "Scan Zap channels to monitor calls";