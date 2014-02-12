#define APP_NAME		"Patate Mod Pack"
#define APP_VERSION	"0.1"
#define WOT_VERSION	"0.8.11"

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
;Compression=lzma2/max
Compression=lzma/fast
SolidCompression=true
ShowLanguageDialog=yes
LanguageDetectionMethod=locale
OutputDir=bin
OutputBaseFilename={#APP_NAME} {#APP_VERSION} (WoT {#WOT_VERSION})
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
WizardImageFile=compiler:WizModernImage-IS.bmp

[Languages]
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"; InfoBeforeFile: "res/infobefore-fr.rtf"; InfoAfterFile: "res/infoafter-fr.rtf"
Name: "en"; MessagesFile: "compiler:Default.isl";          InfoBeforeFile: "res/infobefore-en.rtf"; InfoAfterFile: "res/infoafter-en.rtf"
#include <idp.iss>
; Language file must be included AFTER idp.iss
#include <idplang\default.iss>
#include <idplang\french.iss>

[CustomMessages]
en.InstallationTypeFull=Full installation
fr.InstallationTypeFull=Installation complète
en.InstallationTypeCustom=Custom installation
fr.InstallationTypeCustom=Installation personnalisée
en.CompXVM=XVM
fr.CompXVM=XVM
en.CompXVMClanIcons=Clans icons
fr.CompXVMClanIcons=Icônes des clans
en.CompXVMClanIconsEU=For EU
fr.CompXVMClanIconsEU=Pour EU
en.CompXVMClanIconsRU=For RU
fr.CompXVMClanIconsRU=Pour RU
en.CompXVMClanIconsNA=For NA
fr.CompXVMClanIconsNA=Pour NA
en.CompXVMClanIconsKR=For KR
fr.CompXVMClanIconsKR=Pour KR
en.CompXVMClanIconsSG=For SG
fr.CompXVMClanIconsSG=Pour SG
en.CompHangar=Hanger mods
fr.CompHangar=Mods pour le hangar
en.CompClock=Hangar clock
fr.CompClock=Horloge dans le hangar
en.CompVertTechTree=Vertical Tech Tree
fr.CompVertTechTree=Arbre de recherche vertical
en.CompHangarSkins=Skins
fr.CompHangarSkins=Skins
en.CompHangarSkinDesert=Desert Camp
fr.CompHangarSkinDesert=Désert
en.CompHangarSkinLiveSky=Live Sky
fr.CompHangarSkinLiveSky=Live Sky
en.CompHangarSkinTech=Tech
fr.CompHangarSkinTech=Tech
en.CompHangarSkinCarousel=Carousel
fr.CompHangarSkinCarousel=Carrousel
en.CompCarousel=Multilined TankCarousel
fr.CompCarousel=Carrousel multi-lignes
en.CompCarousel2Row=2 lines carousel
fr.CompCarousel2Row=2 lignes
en.CompCarousel3Row=3 lines carousel
fr.CompCarousel3Row=3 lignes
en.CompMinimap=Minimap
fr.CompMinimap=Minimap
en.CompMinimapHD=HD Minimap
fr.CompMinimapHD=Minimap HD
en.CompMinimapTanksView=Minimap Tanks View
fr.CompMinimapTanksView=Affichage des chars

[Types]
Name: full; Description: {cm:InstallationTypeFull}
Name: custom; Description: {cm:InstallationTypeCustom}; Flags: iscustom

[Components]
Name: "xvm";                       Description: {cm:CompXVM};                Types: full
Name: "xvm\clanicons";             Description: {cm:CompXVMClanIcons};       Types: full
Name: "xvm\clanicons\eu";          Description: {cm:CompXVMClanIconsEU};     Types: full;        Flags: exclusive; ExtraDiskSpaceRequired: 147249635
Name: "xvm\clanicons\kr";          Description: {cm:CompXVMClanIconsKR};                         Flags: exclusive; ExtraDiskSpaceRequired: 5461290
Name: "xvm\clanicons\na";          Description: {cm:CompXVMClanIconsNA};                         Flags: exclusive; ExtraDiskSpaceRequired: 50452481
Name: "xvm\clanicons\sg";          Description: {cm:CompXVMClanIconsSG};                         Flags: exclusive; ExtraDiskSpaceRequired: 10191484
Name: "xvm\clanicons\ru";          Description: {cm:CompXVMClanIconsRU};                         Flags: exclusive; ExtraDiskSpaceRequired: 459201364
Name: "hangar";                    Description: {cm:CompHangar};             Types: full custom; Flags: fixed
Name: "hangar\clock";              Description: {cm:CompClock};              Types: full
Name: "hangar\vtechtree";          Description: {cm:CompVertTechTree};       Types: full
Name: "hangar\carousel";           Description: {cm:CompCarousel};           Types: full
Name: "hangar\carousel\carousel2"; Description: {cm:CompCarousel2Row};       Types: full;        Flags: exclusive
Name: "hangar\carousel\carousel3"; Description: {cm:CompCarousel3Row};                           Flags: exclusive
Name: "hangar\skins";              Description: {cm:CompHangarSkins};        Types: full
Name: "hangar\skins\tech";         Description: {cm:CompHangarSkinTech};     Types: full;        Flags: exclusive
Name: "hangar\skins\desert";       Description: {cm:CompHangarSkinDesert};                       Flags: exclusive
Name: "hangar\skins\livesky";      Description: {cm:CompHangarSkinLiveSky};                      Flags: exclusive
Name: "hangar\skins\carousel";     Description: {cm:CompHangarSkinCarousel};                     Flags: exclusive
Name: "minimap";                   Description: {cm:CompMinimap};            Types: full custom; Flags: fixed
Name: "minimap\hd";                Description: {cm:CompMinimapHD};          Types: full;                          ExtraDiskSpaceRequired: 25064311
Name: "minimap\tanksview";         Description: {cm:CompMinimapTanksView};   Types: full

[Files]
Source: "res\files.ini"; DestDir: "{tmp}"
Source: "res\7za.exe"; DestDir: "{tmp}"
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\clock
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\vtechtree
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\carousel
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\carousel\carousel2
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\carousel\carousel3
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\skins\tech
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\skins\desert
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\skins\livesky
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: hangar\skins\carousel
Source: "data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: minimap\tanksview

[Code]
#include "setup.pas"