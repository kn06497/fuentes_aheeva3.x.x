PATH=C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\Program Files\OpenSSH\bin;C:\Program Files\SSH Communications Security\SSH Secure Shell;C:\Program Files\Java\jdk1.5.0_07\bin
copy dist\commander.jar .
jarsigner -keystore aheevastore  -keypass aheeva -storepass merlin -signedjar scommander.jar commander.jar signFiles -verify