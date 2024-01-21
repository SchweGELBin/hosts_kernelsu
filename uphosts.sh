hostsdir=$MODDIR/system/etc
hostsfile=$hostsdir/hosts

banner() {
echo "####################################################
|              UPHOSTS by SchweGELBin              |
|--------------------------------------------------|
|               Hosts by StevenBlack               |
####################################################
"
info
}

info(){
echo "Your current hosts file has $(cat $hostsfile | wc -l) entries"
}

thanks() {
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
}

help() {
echo "
------------------------------------
Help    - Show this message
Empty   - Clear Hosts / Disable Hosts

Basic   - StevenBlack's Unified hosts
Spark   - StevenBlack's Unified hosts
          with all extensions except social
Full    - StevenBlack's Unified hosts
          with all extensions

Backup  - Backup current hosts
Restore - Restore current hosts

Custom  - Customize hosts
Cleanup - Cleanup Hosts
Cancel  - Cancel this script
------------------------------------"
}

chelp(){
echo "
------------------------------------
Help   - Show this message
Single - Add a single host

Addon  - Append to hosts file
Hosts  - Replace hosts file
File   - Copies another file's content

Cancel - Cancel this script
------------------------------------
"
}


while [[ -z $stop ]]
do
clear
banner
echo "
Choose your hosts file:
"

helpshown="false"
PS3="Enter a number: "
select option in Help Empty Basic Spark Full Backup Restore Custom Cleanup Cancel
do
  echo "Selected option: $option"
  if [[ $REPLY =~ ^[2-8]$ ]]; then
    break
  else
    if [[ $REPLY == 1 ]]; then
      if [[ $helpshown == "false" ]]; then
        help
        helpshown="true"
      fi
    else
      echo "${NUM} is not a valid option..."
    fi
    echo ""
  fi
done
helpshown="false"

case $option in
Empty)
  link=empty
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
Backup)
  cp $hostsfile $hostsdir/hosts-bak
;;
Restore)
  if [[ test -e "$hostsdir/hosts-bak" ]]; then
    > $hostsfile
    cat $hostsdir/hosts-bak >> $hostsfile
  fi
;;
Custom)
  clear
  banner
  select coption in Help Single Addon Hosts File Cancel
  do
    echo "Selected option: $coption"
    if [[ $REPLY =~ ^[2-5]$ ]]; then
      break
    else
      if [[ $REPLY == 1 ]]; then
        if [[ $helpshown == "false" ]]; then
          chelp
          helpshown="true"
        fi
      else
        echo "${NUM} is not a valid option..."
      fi
      echo ""
    fi
  done
  helpshown="false"
  case $coption in
  Hosts)
    echo "
Paste your raw hosts link below:"
    read link
  ;;
  Addon)
    echo "
Paste your raw addon link below:"
    read alink
    if [[ -n $alink ]]; then
      > $hostsfile
      curl -fs $alink >> $hostsfile
    fi
  ;;
  File)
    echo "
Paste your file path below:"
    read path
    if [[ test -e "$path" ]]; then
      > $hostsfile
      cat $path >> $hostsfile
    fi
  ;;
  Single)
    echo "
# Custom hosts below
" >> $hostsfile
    echo "
Enter your host below (Nothing - Quit):"
    while true
    do
      read host
      if [[ -z $host ]]; then
        break
      fi
      echo "0.0.0.0 $host" >> $hostsfile
    done
  ;;
  *)
    echo "Cancelling..."
  ;;
  esac
;;

Cleanup)
  sed -i 's/#.*$//' $hostsfile # Remove comments
  sed -i 's/\s*$//' $hostsfile # Remove blanks at end
  sed -i 's/^\s*//' $hostsfile # Remove blanks at beginning
  sed -i '/^\s*$/d' $hostsfile # Remove empty lines
  sort -u -o $hostsfile{,}     # Remove duplicates
;;
*)
  stop=true
  echo "Cancelling..."
;;
esac

if [[ -n $link ]]; then
  > $hostsfile
  echo ""
  echo "Hosts file cleared"

  if [[ $link == "empty" ]]; then
    echo "127.0.0.1 localhost
::1 ip6-localhost" >> $hostsfile
  else
    curl -fs $link >> $hostsfile
  fi
  
  echo "New hosts file created"
fi
done

echo "Script ran successfully"
clear
banner
thanks

# Debug
#echo "Current hosts file:"
#cat $hostsfile
