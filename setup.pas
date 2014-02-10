function InitializeSetup(): Boolean;
begin
	Result := true;
end;

procedure InitializeWizard();
begin
	idpDownloadAfter(wpReady);
end;

procedure DeinitializeSetup();
begin
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
begin
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
	Result := true;
end;

function BackButtonClick(CurPageID: Integer): Boolean;
begin
	Result := true;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
	Result := false;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
	if CurPageID = wpReady then
	begin
		// User can navigate to 'Ready to install' page several times, so we 
		// need to clear file list to ensure that only needed files are added.
		idpClearFiles;

		if IsComponentSelected('xvm\clanicons\eu') then
			idpAddFile('http://dl1.modxvm.com/clanicons/clanicons-full-eu-20140102.zip', ExpandConstant('{app}\clanicons.zip'));
		if IsComponentSelected('xvm\clanicons\ru') then
			idpAddFile('http://dl1.modxvm.com/clanicons/clanicons-full-ru-20140102.zip', ExpandConstant('{app}\clanicons.zip'));
		if IsComponentSelected('xvm\clanicons\kr') then
			idpAddFile('http://dl1.modxvm.com/clanicons/clanicons-full-kr-20140102.zip', ExpandConstant('{app}\clanicons.zip'));
		if IsComponentSelected('xvm\clanicons\na') then
			idpAddFile('http://dl1.modxvm.com/clanicons/clanicons-full-na-20140102.zip', ExpandConstant('{app}\clanicons.zip'));
		if IsComponentSelected('xvm\clanicons\sg') then
			idpAddFile('http://dl1.modxvm.com/clanicons/clanicons-full-sg-20140102.zip', ExpandConstant('{app}\clanicons.zip'));
	end;
end;

function NeedRestart(): Boolean;
begin
	Result := false;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
end;

procedure InitializeUninstallProgressForm();
begin
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
