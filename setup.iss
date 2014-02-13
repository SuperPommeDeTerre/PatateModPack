#define APP_NAME		"Patate Mod Pack"
#define APP_VERSION	"0.1"
#define WOT_VERSION	"0.8.11"

#include "res/prefs.inc"

[Setup]
AppId={{C1BB1974-7612-4A21-9491-1A27B1EDD070}
AppName={#APP_NAME}
AppVersion={#APP_VERSION}
AppPublisher=SuperPommeDeTerre
AppPublisherURL=http://wot.pixbuf.net/
AppUpdatesURL=http://wot.pixbuf.net/
AppSupportURL=http://wot.pixbuf.net/
DefaultDirName={code:WoTInstallDirectory}
DefaultGroupName={#APP_NAME}
SetupIconFile=res\setup.ico
Compression=lzma2/max
;Compression=lzma/fast
SolidCompression=true
ShowLanguageDialog=yes
LanguageDetectionMethod=locale
OutputDir=bin
OutputBaseFilename={#APP_NAME} {#APP_VERSION} (WoT {#WOT_VERSION})
WizardSmallImageFile="res\BGImageSmall.bmp"
WizardImageFile="res\BGImage.bmp"
; The WoT install directory is magically set (see code:WoTInstallDirectory) !
DisableDirPage=yes

[Languages]
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"; InfoBeforeFile: "res/infobefore-fr.rtf"; InfoAfterFile: "res/infoafter-fr.rtf"
Name: "en"; MessagesFile: "compiler:Default.isl";          InfoBeforeFile: "res/infobefore-en.rtf"; InfoAfterFile: "res/infoafter-en.rtf"
#include <idp.iss>
; Language file must be included AFTER idp.iss
#include <idplang\default.iss>
#include <idplang\french.iss>

[CustomMessages]
#include "res\msg.inc"
en.TaskDelResMods=Delete res_mods folder before install
fr.TaskDelResMods=Effacer le contenu du répertoire res_mods avant l'installation

[Types]
Name: full; Description: {cm:InstallationTypeFull}
Name: custom; Description: {cm:InstallationTypeCustom}; Flags: iscustom

[Dirs]
Name: "{app}\res_mods\{#WOT_VERSION}"; Tasks: taskdelresmods

[InstallDelete]
Type: filesandordirs; Name: "{app}\res_mods\{#WOT_VERSION}"; Tasks: taskdelresmods

[Components]
#include "res\components.inc"

[Tasks]
Name: "taskdelresmods"; Description: {cm:TaskDelResMods}
#include "res\tasks.inc"

[Files]
Source: "res\files.ini";   DestDir: "{tmp}"
Source: "res\7za.exe";     DestDir: "{tmp}"
#include "res\files.inc"

[Code]
#include "res\setup.pas"