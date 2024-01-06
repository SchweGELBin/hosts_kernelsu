clear

echo "--------------------------
  UPHOSTS by SchweGELBin
   Hosts by StevenBlack
--------------------------
"
echo $banner
echo "Choose your hosts file:
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
Cancel - caecel this script
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
echo "
Paste your raw hosts link below:"
read link
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
    echo "New hosts file created"
  fi
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
