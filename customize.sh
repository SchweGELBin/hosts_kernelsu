mkdir -p "$MODPATH/system/etc"
mkdir -p "$MODPATH/system/bin"
mkdir "$MODPATH/worker"

rm /system/bin/uphosts && touch /system/bin/uphosts
rm /data/data/com.termux/files/usr/bin/uphosts && touch /data/data/com.termux/files/usr/bin/uphosts
echo "sudo bash /system/bin/uphosts" >> /data/data/com.termux/files/usr/bin/uphosts

cp -af /system/etc/hosts "$MODPATH/system/etc/hosts"
cp -af /system/bin/uphosts "$MODPATH/system/bin/uphosts"

chcon -r u:object_r:system_file:s0 "$MODPATH/system"
chmod 644 "$MODPATH/system/etc/hosts"
chmod 755 "$MODPATH/system/bin/uphosts"
chmod 755 "/data/data/com.termux/files/usr/bin/uphosts"

cat "$MODPATH/uphosts.sh" >> $MODPATH/system/bin/uphosts
rm "$MODPATH/uphosts.sh"

touch "$MODPATH/skip_mount"
