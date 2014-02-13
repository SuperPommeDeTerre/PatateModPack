type
	TPositionStorage = array of Integer;

{ Some global variables to store infos which are used several times }
var
	gIniFile: String;
	gZzipExe: String;
	CompPageModified: Boolean;
	CompPagePositions: TPositionStorage;

procedure SaveComponentsPage(out Storage: TPositionStorage);
begin
	SetArrayLength(Storage, 10);

	Storage[0] := WizardForm.Height;
	Storage[1] := WizardForm.NextButton.Top;
	Storage[2] := WizardForm.BackButton.Top;
	Storage[3] := WizardForm.CancelButton.Top;
	Storage[4] := WizardForm.ComponentsList.Height;
	Storage[5] := WizardForm.OuterNotebook.Height;
	Storage[6] := WizardForm.InnerNotebook.Height;
	Storage[7] := WizardForm.Bevel.Top;
	Storage[8] := WizardForm.BeveledLabel.Top;
	Storage[9] := WizardForm.ComponentsDiskSpaceLabel.Top;
end;

procedure LoadComponentsPage(const Storage: TPositionStorage; HeightOffset: Integer);
begin
	if GetArrayLength(Storage) <> 10 then
		RaiseException('Invalid storage array length.');

	WizardForm.Height := Storage[0] + HeightOffset;
	WizardForm.NextButton.Top := Storage[1] + HeightOffset;
	WizardForm.BackButton.Top := Storage[2] + HeightOffset;
	WizardForm.CancelButton.Top := Storage[3] + HeightOffset;
	WizardForm.ComponentsList.Height := Storage[4] + HeightOffset;
	WizardForm.OuterNotebook.Height := Storage[5] + HeightOffset;
	WizardForm.InnerNotebook.Height := Storage[6] + HeightOffset;
	WizardForm.Bevel.Top := Storage[7] + HeightOffset;
	WizardForm.BeveledLabel.Top := Storage[8] + HeightOffset;
	WizardForm.ComponentsDiskSpaceLabel.Top := Storage[9] + HeightOffset;
end;

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
	CompPageModified := False;

	ExtractTemporaryFile('files.ini');
	ExtractTemporaryFile('7za.exe');
	gIniFile := ExpandConstant('{tmp}\files.ini');
	gZzipExe := ExpandConstant('{tmp}\7za.exe');
	idpDownloadAfter(wpReady);
end;

procedure CurPageChanged(CurPageID: Integer);
var
	lSelectedComponents: TArrayOfString;
	lSelectedTasks: TArrayOfString;
	i: Integer;
	j: Integer;
	ResultCode: Integer;
	OldState: Boolean;
	lIniKey: String;
begin
	if CurPageID = wpSelectComponents then
	begin
		SaveComponentsPage(CompPagePositions);
		LoadComponentsPage(CompPagePositions, {#ADDITIONAL_COMPONENTS_FORM_HEIGHT});
		CompPageModified := True;
	end
	else if CompPageModified then
	begin
		LoadComponentsPage(CompPagePositions, 0);
		CompPageModified := False;
	end;
	if CurPageID = wpReady then
	begin
		{ Add files to download to queue }
		// User can navigate to 'Ready to install' page several times, so we 
		// need to clear file list to ensure that only needed files are added.
		idpClearFiles;

		{ Handle components }
		Explode(lSelectedComponents, WizardSelectedComponents(false), ',');
		for i := 0 to GetArrayLength(lSelectedComponents) - 1 do
			if IniKeyExists('DownloadedFiles', lSelectedComponents[i], gIniFile) then
			begin
				Log('Downloading file [' + GetIniString('DownloadedFiles', lSelectedComponents[i], '', gIniFile) + '] to [' + ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)) + '] for component [' + lSelectedComponents[i] + ']...');
				idpAddFile(GetIniString('DownloadedFiles', lSelectedComponents[i], '', gIniFile), ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)));
			end;
		{ Handle tasks }
		Explode(lSelectedTasks, WizardSelectedTasks(false), ',');
		for i := 0 to GetArrayLength(lSelectedTasks) - 1 do
			if IniKeyExists('DownloadedFiles', lSelectedTasks[i], gIniFile) then
			begin
				Log('Downloading file [' + GetIniString('DownloadedFiles', lSelectedTasks[i], '', gIniFile) + '] to [' + ExpandConstant(GetIniString('DestFiles', lSelectedTasks[i], '', gIniFile)) + '] for task [' + lSelectedTasks[i] + ']...');
				idpAddFile(GetIniString('DownloadedFiles', lSelectedTasks[i], '', gIniFile), ExpandConstant(GetIniString('DestFiles', lSelectedTasks[i], '', gIniFile)));
			end;
		{ Handle components/tasks }
		for i := 0 to GetArrayLength(lSelectedComponents) - 1 do
			for j := 0 to GetArrayLength(lSelectedTasks) - 1 do
			begin
				lIniKey := lSelectedComponents[i] + ',' + lSelectedTasks[j];
				if IniKeyExists('DownloadedFiles', lIniKey, gIniFile) then
				begin
					Log('Downloading file [' + GetIniString('DownloadedFiles', lIniKey, '', gIniFile) + '] to [' + ExpandConstant(GetIniString('DestFiles', lIniKey, '', gIniFile)) + '] for component/task [' + lIniKey + ']...');
					idpAddFile(GetIniString('DownloadedFiles', lIniKey, '', gIniFile), ExpandConstant(GetIniString('DestFiles', lIniKey, '', gIniFile)));
				end;
			end;
	end
	else if CurPageID = wpInstalling then
	begin
		if IsWin64 then
		begin
			// Turn off redirection, so that cmd.exe from the 64-bit System
			// directory is launched.
			OldState := EnableFsRedirection(False);
		end;
		{ Uncompress files }
		Log('7-zip: ' + gZzipExe);
		{ Handle components }
		Explode(lSelectedComponents, WizardSelectedComponents(false), ',');
		for i := 0 to GetArrayLength(lSelectedComponents) - 1 do
			if IniKeyExists('DownloadedFiles', lSelectedComponents[i], gIniFile) then
			begin
				Log('Extracting file [' + ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)) + '] to [' + ExpandConstant('{app}') + '] for component [' + lSelectedComponents[i] + ']...');
				Log('args: x -y -o"' + ExpandConstant('{app}') + '" "' + ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)) + '"');
				Exec(gZzipExe, 'x -y -o"' + ExpandConstant('{app}') + '" "' + ExpandConstant(GetIniString('DestFiles', lSelectedComponents[i], '', gIniFile)) + '"', ExpandConstant('{tmp}'), SW_HIDE, ewNoWait, ResultCode);
			end;
		{ Handle tasks }
		Explode(lSelectedTasks, WizardSelectedTasks(false), ',');
		for i := 0 to GetArrayLength(lSelectedTasks) - 1 do
			if IniKeyExists('DownloadedFiles', lSelectedTasks[i], gIniFile) then
			begin
				Log('Extracting file [' + ExpandConstant(GetIniString('DestFiles', lSelectedTasks[i], '', gIniFile)) + '] to [' + ExpandConstant('{app}') + '] for task [' + lSelectedTasks[i] + ']...');
				Log('args: x -y -o"' + ExpandConstant('{app}') + '" "' + ExpandConstant(GetIniString('DestFiles', lSelectedTasks[i], '', gIniFile)) + '"');
				Exec(gZzipExe, 'x -y -o"' + ExpandConstant('{app}') + '" "' + ExpandConstant(GetIniString('DestFiles', lSelectedTasks[i], '', gIniFile)) + '"', ExpandConstant('{tmp}'), SW_HIDE, ewNoWait, ResultCode);
			end;
		{ Handle components/tasks }
		for i := 0 to GetArrayLength(lSelectedComponents) - 1 do
			for j := 0 to GetArrayLength(lSelectedTasks) - 1 do
			begin
				lIniKey := lSelectedComponents[i] + ',' + lSelectedTasks[j];
				if IniKeyExists('DownloadedFiles', lIniKey, gIniFile) then
				begin
					Log('Extracting file [' + ExpandConstant(GetIniString('DestFiles', lIniKey, '', gIniFile)) + '] to [' + ExpandConstant('{app}') + '] for task [' + lIniKey + ']...');
					Log('args: x -y -o"' + ExpandConstant('{app}') + '" "' + ExpandConstant(GetIniString('DestFiles', lIniKey, '', gIniFile)) + '"');
					Exec(gZzipExe, 'x -y -o"' + ExpandConstant('{app}') + '" "' + ExpandConstant(GetIniString('DestFiles', lIniKey, '', gIniFile)) + '"', ExpandConstant('{tmp}'), SW_HIDE, ewNoWait, ResultCode);
				end;
			end;
		if IsWin64 then
		begin
			// Restore the previous redirection state.
			EnableFsRedirection(OldState);
		end;
	end;
end;

function NeedRestart(): Boolean;
begin
	Result := false;
end;

{ Get World of Tanks installation directory from .wotreplay file association }
function WoTInstallDirectory(Param: String): String;
var
	WoTInstallDir: String;
begin
	{ Set default value (just in case...) }
	Result := 'C:\Games\World_of_Tanks';
	if (RegKeyExists(HKEY_CLASSES_ROOT, '.wotreplay\DefaultIcon')) then
	begin
		if (RegValueExists(HKEY_CLASSES_ROOT, '.wotreplay\DefaultIcon', '')) then
		begin
			if (RegQueryStringValue(HKEY_CLASSES_ROOT, '.wotreplay\DefaultIcon', '', WoTInstallDir)) then
			begin
				{ Handle case of directory enclosed with quotes (or not) }
				if (Pos('"', WoTInstallDir) = 0) then
				begin
					WoTInstallDir := ExtractFilePath(Copy(WoTInstallDir, 1, Length(WoTInstallDir) - 2));
				end
				else
				begin
					WoTInstallDir := ExtractFilePath(Copy(WoTInstallDir, 2, Length(WoTInstallDir) - 3));
				end;
				{ We have successfully get the install directory. Send it to caller ! }
				Result := WoTInstallDir;
			end;
		end;
	end;
end;
