MODDIR="${0%/*}"

mount -t overlay -o lowerdir=/system/etc,upperdir=$MODDIR/system/etc,workdir=$MODDIR/worker KSU /system/etc
mount -t overlay -o lowerdir=/system/bin,upperdir=$MODDIR/system/bin,workdir=$MODDIR/worker KSU /system/bin
