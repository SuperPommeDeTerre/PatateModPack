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
Compression=lzma2/max
;Compression=lzma/fast
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
en.CompVertTechTreeBtn=Buttons
fr.CompVertTechTreeBtn=Boutons
en.CompVertTechTreeBtnNgcx=New gfx - Credits & XP
fr.CompVertTechTreeBtnNgcx=Nouveaux graphismes - Crédits & XP
en.CompVertTechTreeBtnNgc=New gfx - Credits
fr.CompVertTechTreeBtnNgc=Nouveaux graphismes - Crédits
en.CompVertTechTreeBtnNgx=New gfx - XP
fr.CompVertTechTreeBtnNgx=Nouveaux graphismes - XP
en.CompVertTechTreeBtnNg=New gfx - No buttons
fr.CompVertTechTreeBtnNg=Nouveaux graphismes - Pas de boutons
en.CompVertTechTreeBtnOgcx=Old gfx - Credits & XP
fr.CompVertTechTreeBtnOgcx=Anciens graphismes - Crédits & XP
en.CompVertTechTreeBtnOgc=Old gfx - Credits
fr.CompVertTechTreeBtnOgc=Anciens graphismes - Crédits
en.CompVertTechTreeBtnOgx=Old gfx - XP
fr.CompVertTechTreeBtnOgx=Anciens graphismes - XP
en.CompVertTechTreeBtnOg=Old gfx - No buttons
fr.CompVertTechTreeBtnOg=Anciens graphismes - Pas de boutons
en.CompVertTechTreeLyt=Layout
fr.CompVertTechTreeLyt=Apparence
en.CompVertTechTreeLytBtw=Premiums Between
fr.CompVertTechTreeLytBtw=Premiums entre les chars
en.CompVertTechTreeLytBtm=Premiums Bottom
fr.CompVertTechTreeLytBtm=Premiums en bas
en.CompVertTechTreeLytBtd=Premiums Disbaled
fr.CompVertTechTreeLytBtd=Premiums désactivés
en.CompVertTechTreeLytBtr=Premiums Right
fr.CompVertTechTreeLytBtr=Premiums à droite
en.CompVertTechTreeLytBtt=Premiums Top
fr.CompVertTechTreeLytBtt=Premiums en haut
en.CompVertTechTreeRes=Screen Resolution
fr.CompVertTechTreeRes=Résolution écran
en.CompVertTechTreeRes1024=1024 x 768
fr.CompVertTechTreeRes1024=1024 x 768
en.CompVertTechTreeRes1152=1152 x 864
fr.CompVertTechTreeRes1152=1152 x 864
en.CompVertTechTreeRes1280=1280 x 1024
fr.CompVertTechTreeRes1280=1280 x 1024
en.CompVertTechTreeRes1366=1366 x 768
fr.CompVertTechTreeRes1366=1366 x 768
en.CompVertTechTreeRes1440=1440 x 900
fr.CompVertTechTreeRes1440=1440 x 900
en.CompVertTechTreeRes1600=1600 x 1200
fr.CompVertTechTreeRes1600=1600 x 1200
en.CompVertTechTreeRes1680=1680 x 1050
fr.CompVertTechTreeRes1680=1680 x 1050
en.CompVertTechTreeRes1920=1920 x 1080
fr.CompVertTechTreeRes1920=1920 x 1080
en.CompVertTechTreeRes2048=2048 x 1152
fr.CompVertTechTreeRes2048=2048 x 1152
en.CompVertTechTreeRes2560=2560 x 1600
fr.CompVertTechTreeRes2560=2560 x 1600
en.CompAutoTelescope=Autotelescope (Auto equipment (un)mount)
fr.CompAutoTelescope=Autotelescope (Montage/démontage auto. équipements)
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
en.CompAudio=Audio
fr.CompAudio=Audio
en.CompAudioGFEngines=Gnomefather's Engines
fr.CompAudioGFEngines=Sons des moteurs Gnomefather
en.CompAudioGFGuns=Historical Realism Gun sound mod 1.8621
fr.CompAudioGFGuns=Sons des canons Gnomefather
en.CompGFX=Graphic improvements
fr.CompGFX=Améliorations graphiques

[Types]
Name: full; Description: {cm:InstallationTypeFull}
Name: custom; Description: {cm:InstallationTypeCustom}; Flags: iscustom

[Components]
Name: "xvm";                       Description: {cm:CompXVM};                 Types: full;                          ExtraDiskSpaceRequired: 7433112
Name: "xvm\clanicons";             Description: {cm:CompXVMClanIcons};        Types: full
Name: "xvm\clanicons\eu";          Description: {cm:CompXVMClanIconsEU};      Types: full;        Flags: exclusive; ExtraDiskSpaceRequired: 147249635
Name: "xvm\clanicons\kr";          Description: {cm:CompXVMClanIconsKR};                          Flags: exclusive; ExtraDiskSpaceRequired: 5461290
Name: "xvm\clanicons\na";          Description: {cm:CompXVMClanIconsNA};                          Flags: exclusive; ExtraDiskSpaceRequired: 50452481
Name: "xvm\clanicons\sg";          Description: {cm:CompXVMClanIconsSG};                          Flags: exclusive; ExtraDiskSpaceRequired: 10191484
Name: "xvm\clanicons\ru";          Description: {cm:CompXVMClanIconsRU};                          Flags: exclusive; ExtraDiskSpaceRequired: 459201364
Name: "hangar";                    Description: {cm:CompHangar};              Types: full custom; Flags: fixed
Name: "hangar\clock";              Description: {cm:CompClock};               Types: full
Name: "hangar\vtechtree";          Description: {cm:CompVertTechTree};        Types: full;                          ExtraDiskSpaceRequired: 556976
Name: "hangar\vtechtree\btn";      Description: {cm:CompVertTechTreeBtn};     Types: full custom; Flags: fixed
Name: "hangar\vtechtree\btn\ngcx"; Description: {cm:CompVertTechTreeBtnNgcx}; Types: full;        Flags: exclusive
Name: "hangar\vtechtree\btn\ngc";  Description: {cm:CompVertTechTreeBtnNgc};                      Flags: exclusive
Name: "hangar\vtechtree\btn\ngx";  Description: {cm:CompVertTechTreeBtnNgx};                      Flags: exclusive
Name: "hangar\vtechtree\btn\ng";   Description: {cm:CompVertTechTreeBtnNg};                       Flags: exclusive
Name: "hangar\vtechtree\btn\ogcx"; Description: {cm:CompVertTechTreeBtnOgcx};                     Flags: exclusive
Name: "hangar\vtechtree\btn\ogc";  Description: {cm:CompVertTechTreeBtnOgc};                      Flags: exclusive
Name: "hangar\vtechtree\btn\ogx";  Description: {cm:CompVertTechTreeBtnOgx};                      Flags: exclusive
Name: "hangar\vtechtree\btn\og";   Description: {cm:CompVertTechTreeBtnOg};                       Flags: exclusive
Name: "hangar\vtechtree\lyt";      Description: {cm:CompVertTechTreeLyt};     Types: full custom; Flags: fixed
Name: "hangar\vtechtree\lyt\btw";  Description: {cm:CompVertTechTreeLytBtw};  Types: full;        Flags: exclusive
Name: "hangar\vtechtree\lyt\btm";  Description: {cm:CompVertTechTreeLytBtm};                      Flags: exclusive
Name: "hangar\vtechtree\lyt\btd";  Description: {cm:CompVertTechTreeLytBtd};                      Flags: exclusive
Name: "hangar\vtechtree\lyt\btr";  Description: {cm:CompVertTechTreeLytBtr};                      Flags: exclusive
Name: "hangar\vtechtree\lyt\btt";  Description: {cm:CompVertTechTreeLytBtt};                      Flags: exclusive
Name: "hangar\vtechtree\res";      Description: {cm:CompVertTechTreeRes};     Types: full custom; Flags: fixed
Name: "hangar\vtechtree\res\1024"; Description: {cm:CompVertTechTreeRes1024};                     Flags: exclusive
Name: "hangar\vtechtree\res\1152"; Description: {cm:CompVertTechTreeRes1152};                     Flags: exclusive
Name: "hangar\vtechtree\res\1280"; Description: {cm:CompVertTechTreeRes1280};                     Flags: exclusive
Name: "hangar\vtechtree\res\1366"; Description: {cm:CompVertTechTreeRes1366};                     Flags: exclusive
Name: "hangar\vtechtree\res\1440"; Description: {cm:CompVertTechTreeRes1440};                     Flags: exclusive
Name: "hangar\vtechtree\res\1600"; Description: {cm:CompVertTechTreeRes1600};                     Flags: exclusive
Name: "hangar\vtechtree\res\1680"; Description: {cm:CompVertTechTreeRes1680};                     Flags: exclusive
Name: "hangar\vtechtree\res\1920"; Description: {cm:CompVertTechTreeRes1920}; Types: full;        Flags: exclusive
Name: "hangar\vtechtree\res\2048"; Description: {cm:CompVertTechTreeRes2048};                     Flags: exclusive
Name: "hangar\vtechtree\res\2560"; Description: {cm:CompVertTechTreeRes2560};                     Flags: exclusive
Name: "hangar\autotelescope";      Description: {cm:CompAutoTelescope};       Types: full;                          ExtraDiskSpaceRequired: 87
Name: "hangar\carousel";           Description: {cm:CompCarousel};            Types: full;                          ExtraDiskSpaceRequired: 379931
Name: "hangar\carousel\carousel2"; Description: {cm:CompCarousel2Row};        Types: full;        Flags: exclusive
Name: "hangar\carousel\carousel3"; Description: {cm:CompCarousel3Row};                            Flags: exclusive
Name: "hangar\skins";              Description: {cm:CompHangarSkins};         Types: full
Name: "hangar\skins\tech";         Description: {cm:CompHangarSkinTech};      Types: full;        Flags: exclusive
Name: "hangar\skins\desert";       Description: {cm:CompHangarSkinDesert};                        Flags: exclusive
Name: "hangar\skins\livesky";      Description: {cm:CompHangarSkinLiveSky};                       Flags: exclusive
Name: "hangar\skins\carousel";     Description: {cm:CompHangarSkinCarousel};                      Flags: exclusive
Name: "minimap";                   Description: {cm:CompMinimap};             Types: full custom; Flags: fixed
Name: "minimap\hd";                Description: {cm:CompMinimapHD};           Types: full;                          ExtraDiskSpaceRequired: 25064311
Name: "minimap\tanksview";         Description: {cm:CompMinimapTanksView};    Types: full
Name: "audio";                     Description: {cm:CompAudio};               Types: full custom; Flags: fixed
Name: "audio\gfengines";           Description: {cm:CompAudioGFEngines};      Types: full
Name: "audio\gfguns";              Description: {cm:CompAudioGFGuns};         Types: full
Name: "gfx";                       Description: {cm:CompGFX};                 Types: full custom; Flags: fixed

[Files]
Source: "res\files.ini"; DestDir: "{tmp}"
Source: "res\7za.exe"; DestDir: "{tmp}"

[Code]
#include "setup.pas"