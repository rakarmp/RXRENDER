SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=true
CLEANSERVICE=true
DEBUG=true
MODDIR=/data/adb/modules
unzip -o "$ZIPFILE" 'addon/*' -d $TMPDIR >&2
unzip -o "$ZIPFILE" 'tmp/*' -d $MODPATH >&2

ui_print "    ＲＥＸ ＲＥＮＤＥＲ "
sleep 01
sleep 1
ui_print "    𝑫𝑬𝑽𝑰𝑪𝑬 𝑰𝑵𝑭𝑶: "
sleep 0.2
ui_print "    𝑫𝑬𝑽𝑰𝑪𝑬 : $(getprop ro.product.model) "
sleep 0.2
ui_print "    𝑩𝑹𝑨𝑵𝑫 : $(getprop ro.product.system.brand) "
sleep 0.2
ui_print "    𝑴𝑶𝑫𝑬𝑳 : $(getprop ro.build.product) "
sleep 0.2
ui_print "    𝑲𝑬𝑹𝑵𝑬𝑳 : $(uname -r) "
sleep 0.2
ui_print "    𝑷𝑹𝑶𝑪   : $(getprop ro.product.board) "
sleep 1
. $TMPDIR/addon/Volume-Key-Selector/install.sh
ui_print "*"
ui_print "   Choose your desire one "
ui_print "  1. OpenGL "
ui_print "  2. SkiaGL "
ui_print "  3. VulkanSkia "
ui_print "*"
sleep 2
ui_print "   "
rexrender=1
while true; do
ui_print "  $rexrender"
if $VKSEL; then
rexrender=$((rexrender + 1))
else
break
break
fi
if [ $rexrender -gt 3 ]; then
rexrender=1
break
break
fi
done
case $rexrender in
1 ) RXR="> Open GL "; sed -i '/debug.hwui.renderer/s/.*/debug.hwui.renderer=opengl/' $props;;
2 ) RXR="> Skia GL "; sed -i '/debug.hwui.renderer/s/.*/debug.hwui.renderer=skiagl/' $props;;
3 ) RXR="> Vulkan Skia "; sed -i '/debug.hwui.renderer/s/.*/debug.hwui.renderer=skiavk/' $props;;
esac
ui_print ""
ui_print " MODE : $RXR "
ui_print ""
sleep 1
am start -a android.intent.action.VIEW -d https://t.me/Zyarexx >/dev/null 2>&1 & >/dev/null 2>&1 &
sleep 1
set_permissions() {
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm_recursive "$MODPATH/system/bin" 0 0 0755 0755
set_perm_recursive "$MODPATH/system/xbin" 0 0 0755 0755
set_perm_recursive "$MODPATH/bin" 0 0 0755 0755
set_perm_recursive "$MODPATH/gsmsd/bin" 0 0 0755 0755
set_perm_recursive "$MODPATH/gsmsd/" 0 0 0755 0755
set_perm_recursive "$MODPATH/gsmexy/bin" 0 0 0755 0755
set_perm_recursive "$MODPATH/gsmmtk/bin" 0 0 0755 0755
}
