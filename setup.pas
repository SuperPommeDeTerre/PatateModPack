var
	gIniFile: String;


function Count(What, Where: String): Integer;
begin
	Result := 0;
	if Length(What) = 0 then
		exit;
	while Pos(What,Where)>0 do
	begin
		Where := Copy(Where, Pos(What, Where) + Length(What), Length(Where));
		Result := Result + 1;
	end;
end;

{ Split text to array }
procedure Explode(var ADest: TArrayOfString; aText, aSeparator: String);
var
	tmp: Integer;
begin
	if aSeparator = '' then
		exit;
	SetArrayLength(ADest, Count(aSeparator, aText) + 1)
	tmp := 0;
	repeat
		if Pos(aSeparator,aText)>0 then
		begin
			ADest[tmp] := Copy(aText, 1, Pos(aSeparator, aText) - 1);
			aText := Copy(aText, Pos(aSeparator, aText) + Length(aSeparator), Length(aText));
			tmp := tmp + 1;
		end else
		begin
			ADest[tmp] := aText;
			aText := '';
		end;
	until Length(aText)=0;
end;

procedure InitializeWizard();
begin
	ExtractTemporaryFile('files.ini');
	gIniFile := ExpandConstant('{tmp}\files.ini');
	idpDownloadAfter(wpReady);
end;

procedure CurPageChanged(CurPageID: Integer);
var
	lSelectedComponents: TArrayOfString;
	i: Integer;
begin
	if CurPageID = wpReady then
	begin
		// User can navigate to 'Ready to install' page several times, so we 
		// need to clear file list to ensure that only needed files are added.
		idpClearFiles;

		Explode(lSelectedComponents, WizardSelectedComponents(false), ',');
		for i := 0 to GetArrayLength(lSelectedComponents) - 1 do
			if IniKeyExists('DownloadedFiles', lSelectedComponents[i], gIniFile) then
			begin
				{Log(lSelectedComponents[i]);
				Log(GetIniString('DownloadedFiles', lSelectedComponents[i], '', gIniFile));
				Log(ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)));}
				idpAddFile(GetIniString('DownloadedFiles', lSelectedComponents[i], '', gIniFile), ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)));
			end;
	end
	else if CurPageID = then
	begin
		{ Uncompress files }
		// TODO
	end;
end;

function NeedRestart(): Boolean;
begin
	Result := false;
end;

{ Fonction d'extraction du chemin de WoT }
function WoTInstallDirectory(Param: String): String;
var
	WoTInstallDir: String;
begin
	{ On positionne une valeur par defaut (au cas ou...) }
	Result := 'C:\Games\World_of_Tanks';
	if (RegKeyExists(HKEY_CLASSES_ROOT, '.wotreplay\DefaultIcon')) then
	begin
		if (RegValueExists(HKEY_CLASSES_ROOT, '.wotreplay\DefaultIcon', '')) then
		begin
			if (RegQueryStringValue(HKEY_CLASSES_ROOT, '.wotreplay\DefaultIcon', '', WoTInstallDir)) then
			begin
				{ On gere le cas ou le chemin est entoure de " }
				if (Pos('"', WoTInstallDir) = 0) then
				begin
					WoTInstallDir := ExtractFilePath(Copy(WoTInstallDir, 1, Length(WoTInstallDir) - 2));
				end
				else
				begin
					WoTInstallDir := ExtractFilePath(Copy(WoTInstallDir, 2, Length(WoTInstallDir) - 3));
				end;
				{ Tout est ok. On affecte le resultat }
				Result := WoTInstallDir;
			end;
		end;
	end;
end;
