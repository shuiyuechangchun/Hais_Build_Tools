#!/bin/bash
BINS=$PWD/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录

#/system/app/securityadd
DELETE_SYSTEM="/system/app/AiAsstVision
/system/app/VoiceAssist
/system/app/VoiceTrigger
/system/app/AnalyticsCore
/system/app/BasicDreams
/system/app/BookmarkProvider
/system/app/BTProductionLineTool
/system/app/BuiltInPrintService
/system/app/WallpaperBackup
/system/app/BluetoothMidiService
/system/app/goodix_sz
/system/app/GooglePrintRecommendationService
/system/app/MiLinkService2
/system/app/Joyose
/system/app/CarrierDefaultApp
/system/app/CatchLog
/system/app/Cit
/system/app/CtsShimPrebuilt
/system/app/FidoAuthen
/system/app/FM
/system/app/HTMLViewer
/system/app/HybridAccessory
/system/app/HybridPlatform
/system/app/KSICibaEngine
/system/app/mab
/system/app/mi_connect_service
/system/app/Mipay
/system/app/MiPlayClient
/system/app/MiRadio
/system/app/MiuiAudioMonitor
/system/app/MiuiBugReport
/system/app/MiuiDaemon
/system/app/MiuiSuperMarket
/system/app/MSA
/system/app/NextPay
/system/app/PacProcessor
/system/app/PaymentService
/system/app/PrintSpooler
/system/app/SecurityInputMethod
/system/app/SimAppDialog
/system/app/Stk
/system/app/TouchAssistant
/system/app/Traceur
/system/app/TranslationService
/system/app/Updater
/system/app/VsimCore
/system/app/WAPPushManager
/system/app/WMService
/system/app/XiaomiModemDebugService
/system/app/YouDaoEngine
/system/app/Zman
/system/app/mab
/system/data-app
/system/framework/arm
/system/framework/arm64
/system/framework/oat
/system/framework/boot.vdex
/system/framework/boot-android.test.base.vdex
/system/framework/boot-apache-xml.vdex
/system/framework/boot-bouncycastle.vdex
/system/framework/boot-com.nxp.nfc.nq.vdex
/system/framework/boot-core-libart.vdex
/system/framework/boot-ext.vdex
/system/framework/boot-framework.vdex
/system/framework/boot-ims-common.vdex
/system/framework/boot-miuisdk@boot.vdex
/system/framework/boot-miuisystemsdk@boot.vdex
/system/framework/boot-okhttp.vdex
/system/framework/boot-qcom.fmradio.vdex
/system/framework/boot-QPerformance.vdex
/system/framework/boot-tcmiface.vdex
/system/framework/boot-telephony-common.vdex
/system/framework/boot-telephony-ext.vdex
/system/framework/boot-UxPerformance.vdex
/system/framework/boot-voip-common.vdex
/system/framework/boot-WfdCommon.vdex
/system/media/wallpaper
/system/app/CatcherPatch
/system/app/MiuiAccessibility
/system/priv-app/ContentExtension
/system/priv-app/MiShare
/system/priv-app/NewHome
/system/priv-app/PersonalAssistant
/system/product/priv-app/GmsCore
/system/product/priv-app/GooglePartnerSetup
/system/product/priv-app/GooglePlayServicesUpdater
/system/product/priv-app/GoogleServicesFramework
/system/product/priv-app/GoogleOneTimeInitializer
/system/priv-app/BlockedNumberProvider
/system/priv-app/Browser
/system/priv-app/CallLogBackup
/system/priv-app/DMRegService
/system/priv-app/MiGameCenterSDKService
/system/priv-app/MiRcs
/system/priv-app/MiService
/system/priv-app/MiuiVideo
/system/priv-app/Music
/system/priv-app/MusicFX
/system/priv-app/com.qualcomm.location
/system/priv-app/QuickSearchBox
/system/priv-app/SoundRecorder
/system/app/systemAdSolution
/system/app/MSA-CN-NO_INSTALL_PACKAGE
/system/app/talkback
/system/app/PhotoTable
/system/app/mid_test
/system/app/MiuiVpnSdkManager
/system/app/FidoClient
/system/app/FidoCryptoService
/system/app/AutoTest
/system/app/AutoRegistration
/system/app/PrintRecommendationService
/system/app/SeempService
/system/app/com.miui.qr
/system/app/GPSLogSave
/system/app/SystemHelper
/system/app/SYSOPT
/system/app/xdivert
/system/app/MiuiDaemon
/system/app/Qmmi
/system/app/QdcmFF
/system/app/Xman
/system/app/Yman
/system/app/seccamsample
/system/app/greenguard
/system/app/QColor
/system/priv-app/dpmserviceapp
/system/priv-app/EmergencyInfo
/system/priv-app/UserDictionaryProvider
/system/priv-app/ONS
/system/product/app/datastatusnotification
/system/product/app/PhotoTable
/system/product/app/QdcmFF
/system/product/app/talkback
/system/product/app/xdivert
/system/product/priv-app/dpmserviceapp
/system/product/priv-app/EmergencyInfo
/system/product/priv-app/seccamservice
/system/product/priv-app/ConfigUpdater
/system/data-app
/system/etc/auto-install.json
/system/vendor/data-app
/system/media/audio/notifications/Bottle.ogg
/system/media/audio/notifications/Bubble.ogg
/system/media/audio/notifications/Bullfrog.ogg
/system/media/audio/notifications/Burst.ogg
/system/media/audio/notifications/Chirp.ogg
/system/media/audio/notifications/Clank.ogg
/system/media/audio/notifications/Crystal.ogg
/system/media/audio/notifications/FadeIn.ogg
/system/media/audio/notifications/FadeOut.ogg
/system/media/audio/notifications/Flute.ogg
/system/media/audio/notifications/Fresh.ogg
/system/media/audio/notifications/Frog.ogg
/system/media/audio/notifications/Harp.ogg
/system/media/audio/notifications/IncomingMessage.ogg
/system/media/audio/notifications/MessageSent.ogg
/system/media/audio/notifications/Moment.ogg
/system/media/audio/notifications/Potion.ogg
/system/media/audio/notifications/Radar.ogg
/system/media/audio/notifications/Spring.ogg
/system/media/audio/notifications/Swoosh.ogg
/system/media/audio/alarms/AlarmClock.ogg
/system/media/audio/alarms/Beep.ogg
/system/media/audio/alarms/Breeze.ogg
/system/media/audio/alarms/Chimes.ogg
/system/media/audio/alarms/Morning.ogg
/system/media/audio/alarms/Sunrise.ogg
/system/etc/fake_cdrom_install.iso
/verity_key"

DELETE_VENDOR="/vendor/app/GFManager/
/vendor/app/aiasst_service/
/vendor/data-app/Youpin/
/vendor/data-app/Health/
/vendor/data-app/SmartHome/
/vendor/data-app/wps-lite/
/vendor/data-app/XMRemoteController/
/vendor/etc/scve/
/vendor/app/GFTest/"



ROM_SYSTEM=$WORK_SRC_PATH/system
ROM_VENDOR=$WORK_SRC_PATH/vendor


#精简和删除文件
for file in $DELETE_SYSTEM ; do
	deleteBack /system/$file
done
for file in $DELETE_VENDOR ; do
	deleteBack $file
done