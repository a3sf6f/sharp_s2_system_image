#!/system/bin/sh
#remove CDAStatus
/system/bin/rm "/hidden/data/CDA/CDAStatus"

#Run initCDA
if [ ! -f /hidden/data/CDA/CDASKUFinish ]; then
    /system/bin/InitCDA -all
    echo 1 > /hidden/data/CDA/CDASKUFinish
fi

/system/bin/chown system.system  /hidden/data/CDA/CDASKUFinish
/system/bin/chmod 664  /hidden/data/CDA/CDASKUFinish

#FihtdcCode@20160127 LiChuWang for PFAM-132 Begin
/system/bin/echo XXX > /data/cda/bootanimationTemp.zip
/system/bin/chmod 777 /data/cda/bootanimationTemp.zip
#FihtdcCode@20160127 LiChuWang for PFAM-132 End
