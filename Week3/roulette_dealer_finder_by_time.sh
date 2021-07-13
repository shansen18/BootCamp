 #!/bin/bash/

read -p 'Input Date (four numbers): ' da
read -p 'Input time: ' ti
read -p 'Input A for AM or P for PM: ' am

awk '/'${ti}':00:00 '${am}'M/ {print $1,$2,$5,$6}' ${da}_Dealer_schedule

