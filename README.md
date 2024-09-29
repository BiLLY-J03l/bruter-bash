# bruter
a reliable brute force tool with bash

-This script uses the full power of curl and bash to brute force any login page, with exceptions.

-You have to be familiar with the terminal and Bash scripting to tweak the code for your needs.

-I wrote the script as thc-hydra wasn't as good with live targets and kept ignoring the valid credentials.

-Do your research over the response you want to get with BurpSuite.

-Get the desired curl request from BurpSuite (recommended).

-Modify the cmd variable in the script and add the curl switches you need from the comments in the script.

-Installation:

1-

    git clone https://github.com/BiLLY-J03l/bruter.git

2-

    chmod +x bruter.sh
    
3-

    ./bruter.sh users.txt pass.txt
