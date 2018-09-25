#!/bin/sh
## BurgessC

##定义循环变量F_forever、定义Nginx重启情况变量、定义文件是否存
F_forever="1"
L_ls=`ls / |grep "run.sh" |wc -l`
#N_start='ps -ef |grep nginx  |grep -v grep | wc -l'

## 把work目录权限给用户wwww
chown -R www:www /work/

##start Nginx
/work/nginx/sbin/nginx -c /work/nginx/conf/nginx.conf

## 检查并启动Nginx
while [[ $F_forever == 1 ]]
do
    N_start='ps -ef |grep nginx  |grep -v grep | wc -l'
    if [ $N_start == 0 ];then
        /work/nginx/sbin/nginx -c /work/nginx/conf/nginx.conf
    else
        sleep 1
    fi
done
