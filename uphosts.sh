clear

echo "--------------------------
  UPHOSTS by SchweGELBin
   Hosts by StevenBlack
--------------------------
"
echo "Your current hosts file has $(cat $MODDIR/system/etc/hosts | wc -l) entries
Choose your hosts file:
"

PS3="Enter a number: "
select option in Help Empty Basic Spark Full Custom Cancel
do
echo "Selected option: $option"
if [[ $REPLY =~ ^[2-7]$ ]]; then
  break
else
  if [[ $REPLY == 1 ]]; then
    echo "
------------------------------------
Help  - Show this message
Empty - Clear Hosts / Disable Hosts

Basic - StevenBlack's Unified hosts
Spark - StevenBlack's Unified hosts
        with all extensions except social
Full  - StevenBlack's Unified hosts
        with all extensions

Custom - User hosts link
Cancel - Cancel this script
------------------------------------
"
    else
      echo "${NUM} is not a valid option..."
    fi
fi
done

case $option in
Help)
cancel=true
;;
Empty)
empty=true
;;
Basic)
link=https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
;;
Spark)
link=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
;;
Full)
link=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
;;

Custom)
clear
select coption in Help Single Addon Hosts Cancel
do
echo "Selected option: $coption"
if [[ $REPLY =~ ^[2-5]$ ]]; then
  break
else
  if [[ $REPLY == 1 ]]; then
    echo "
------------------------------------
Help    - Show this message
Single - Add a single host

Addon - Append to hosts file
Hosts - Replace hosts file

Cancel - Cancel this script
------------------------------------
"
    else
      echo "${NUM} is not a valid option..."
    fi
fi
done
case $coption in
Help)
cancel=true;
;;
Hosts)
echo "
Paste your raw hosts link below:"
read link
;;
Addon)
echo "
Paste your raw addon link below:"
read link
echo "" >> $MODDIR/system/etc/hosts
curl -fs $link >> $MODDIR/system/etc/hosts
cancel=true
;;
Single)
echo "
# Custom hosts below
" >> $MODDIR/system/etc/hosts
echo "
Enter your host below (Nothing - Quit):"
while true
do
  read host
  if [[ -z $host ]]; then
    break
  fi
  echo "127.0.0.1       $host" >> $MODDIR/system/etc/hosts
done
cancel=true
;;
Cancel)
cancel=true
;;
*)
cancel=true
;;
esac
;;

Cancel)
cancel=true
;;
*)
cancel=true
;;
esac

if [[ -z $cancel  ]]; then
  > $MODDIR/system/etc/hosts
  echo ""
  echo "Hosts file cleared"

  if [[ -z $empty  ]]; then
    curl -fs $link >> $MODDIR/system/etc/hosts
  else
    echo "127.0.0.1       localhost
::1             ip6-localhost" >> $MODDIR/system/etc/hosts
  fi
  
  echo "New hosts file created"
fi

echo "Script ran successfully"
clear

echo "
####################################################
|         Thank you for using this module!         |
|          Please check out SchweGELBin's          |
|             and StevenBlack's Github             |
|--------------------------------------------------|
|  https://github.com/SchweGELBin/hosts_kernelsu   |
|  https://github.com/StevenBlack/hosts            |
####################################################
"
