program CheckingDrives;
{
 Checking for Drives, is a simple delphi source code that working with unicode systems,
 that can show you and demonstrate how to check if awer executable executed from USB drive or not,
 and if not it will show you what type of drive it ran from.

 Simple and free open source delphi to learn from it.
 Http://WwW.Hs32-Idir.tk

}


uses windows;

function CheckIfFromUSB: Boolean;
{Unicode Hs32-Idir}
var
  DriveType: Integer;
  MaxPath:Array[0..255] of WChar;
begin
  Result := False;
  GetModuleFileNameW(HInstance, @MaxPath[0], MAX_PATH*2);
  try
    DriveType := GetDriveTypeW(PwideChar(WideString(MaxPath[0]) + ':\'));
    Case DriveType of
      DRIVE_REMOVABLE : Result := True;
      else Result := False;
    end;
   except
    Result := False;
 end;
end;

function WhichDriveIs: Boolean;
{Unicode Hs32-Idir}
var
  DriveType: Integer;
  MaxPath:Array[0..255] of WChar;
begin
  Result := False;
  GetModuleFileNameW(HInstance, @MaxPath[0], MAX_PATH*2);
  try
    Result := True;
    DriveType := GetDriveTypeW(PwideChar(WideString(MaxPath[0]) + ':\'));
    Case DriveType of
      DRIVE_UNKNOWN     : MessageBoxW(0,'Uncknown Drive','',0);
      DRIVE_NO_ROOT_DIR : MessageBoxW(0,'No root dir','',0);
      DRIVE_REMOVABLE   : MessageBoxW(0,'Removable drive','',0);
      DRIVE_FIXED   : MessageBoxW(0,'Fixed drive','',0);
      DRIVE_REMOTE  : MessageBoxW(0,'Remote drive','',0);
      DRIVE_CDROM   : MessageBoxW(0,'CD-Rom','',0);
      DRIVE_RAMDISK : MessageBoxW(0,'Ram disk','',0);
     else
       begin
         MessageBoxW(0,'Nothing','',0);
         Result := False;
       end;
    end;
   except
    MessageBoxW(0,'Nothing','',0);
    Result := False;
 end;
end;

var
  IsFileRuningUSB:Boolean;
begin
   IsFileRuningUSB := CheckIfFromUSB;
  if IsFileRuningUSB then
   MessageBoxW(0,'Iam Executed From USB Drive','hello',0)
  else if not IsFileRuningUSB then
   begin
     MessageBoxW(0,'Iam Not Executed From USB Drive','hello',0);
     WhichDriveIs;
   end;

end.