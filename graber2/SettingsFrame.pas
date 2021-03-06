unit SettingsFrame;

interface

uses
  {std}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, MyINIFile, ShellAPI, ImgList, ExtCtrls, StrUtils, UITypes,
  {devex}
  cxPCdxBarPopupMenu, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxControls, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxTLdxBarBuiltInMenu, cxContainer, cxEdit, cxEditRepositoryItems, cxVGrid,
  cxSpinEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLabel, cxPC, cxSplitter,
  cxInplaceContainer, StdCtrls, cxButtons, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid,
  dxSkinsdxBarPainter, dxBar,
  {Graber}
  cxmymultirow, MyHTTP, Common, GraberU, cxNavigator, cxBarEditItem,
  cxHyperLinkEdit;
{
  dxSkinsdxBarPainter, dxBar, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;
}

type
  TfSettings = class(TFrame)
    pButtons: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    tlList: TcxTreeList;
    cxSplitter1: TcxSplitter;
    tlcCaption: TcxTreeListColumn;
    pcMain: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    eThreads: TcxSpinEdit;
    chbUseThreadPerRes: TcxCheckBox;
    eThreadPerRes: TcxSpinEdit;
    ePicThreads: TcxSpinEdit;
    eRetries: TcxSpinEdit;
    lcThreads: TcxLabel;
    lcThreadPerRes: TcxLabel;
    lcPicThreads: TcxLabel;
    lcRetries: TcxLabel;
    cxTabSheet3: TcxTabSheet;
    chbProxyAuth: TcxCheckBox;
    eHost: TcxTextEdit;
    eProxyLogin: TcxTextEdit;
    ePort: TcxSpinEdit;
    eProxyPassword: TcxTextEdit;
    chbProxySavePWD: TcxCheckBox;
    lcProxyHost: TcxLabel;
    lcProxyPort: TcxLabel;
    lcProxyLogin: TcxLabel;
    lcProxyPassword: TcxLabel;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet1: TcxTabSheet;
    vgSettings: TcxVerticalGrid;
    lcLanguage: TcxLabel;
    cbLanguage: TcxComboBox;
    chbAutoUpdate: TcxCheckBox;
    lCheckNow: TcxLabel;
    cxEditRepository: TcxEditRepository;
    eAuthButton: TcxEditRepositoryButtonItem;
    cxTabSheet6: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    btnApply: TcxButton;
    chbShowWhatsNew: TcxCheckBox;
    lSkin: TcxLabel;
    cbSkin: TcxComboBox;
    chbUseLookAndFeel: TcxCheckBox;
    cxTabSheet5: TcxTabSheet;
    gDoublesLevel1: TcxGridLevel;
    gDoubles: TcxGrid;
    tvDoubles: TcxGridTableView;
    cDoublesRuleName: TcxGridColumn;
    cDoublesRules: TcxGridColumn;
    eMemo: TcxEditRepositoryMemoItem;
    BarManager: TdxBarManager;
    DoublesActions: TdxBar;
    bcDoubles: TdxBarDockControl;
    bbNewRule: TdxBarButton;
    bbEditRule: TdxBarButton;
    bbDeleteRule: TdxBarButton;
    il: TcxImageList;
    chbMenuCaptions: TcxCheckBox;
    lHelp: TcxLabel;
    lcSpeed: TcxLabel;
    eSpeed: TcxSpinEdit;
    cxLabel6: TcxLabel;
    chbTips: TcxCheckBox;
    chbLogMode: TcxCheckBox;
    chbUseDistr: TcxCheckBox;
    cxTabSheet7: TcxTabSheet;
    cBLComboBox: TcxEditRepositoryComboBoxItem;
    BarManagerBar1: TdxBar;
    bbNewBlackword: TdxBarButton;
    bbDelBlackword: TdxBarButton;
    chbUseBlackList: TcxCheckBox;
    Panel1: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    gBlackList: TcxGrid;
    tvBlackList: TcxGridTableView;
    cChWhat: TcxGridColumn;
    cChWith: TcxGridColumn;
    gBlackListLevel1: TcxGridLevel;
    lblProxy: TcxLabel;
    cbProxy: TcxComboBox;
    cbProxyType: TcxComboBox;
    lblProxyType: TcxLabel;
    chbUncheckBlacklisted: TcxBarEditItem;
    eStopSignalTimer: TcxSpinEdit;
    lcStopSignalTimer: TcxLabel;
    chbIncludeSkins: TcxCheckBox;
    chbPAC: TcxCheckBox;
    ePACHost: TcxTextEdit;
    dlgOpen: TOpenDialog;
    btnProfile: TcxButton;
    pmProfile: TPopupMenu;
    pmmSave: TMenuItem;
    pmmLoad: TMenuItem;
    N1: TMenuItem;
    pmmRemove: TMenuItem;
    procedure btnOkClick(Sender: TObject);
    procedure chbProxyPropertiesEditValueChanged(Sender: TObject);
    procedure chbProxyAuthPropertiesEditValueChanged(Sender: TObject);
    procedure tlListFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure lCheckNowClick(Sender: TObject);
    procedure cxeAuthButtonPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLabel5Click(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure bbDeleteRuleClick(Sender: TObject);
    procedure bbNewRuleClick(Sender: TObject);
    procedure bbEditRuleClick(Sender: TObject);
    procedure lHelpClick(Sender: TObject);
    procedure bbNewBlackwordClick(Sender: TObject);
    procedure bbDelBlackwordClick(Sender: TObject);
    procedure cbProxyPropertiesChange(Sender: TObject);
    procedure btnProfileClick(Sender: TObject);
    procedure pmmCaptionClick(Sender: TObject);
    procedure pmmSaveClick(Sender: TObject);
    procedure FrameClick(Sender: TObject);
    procedure pmmLoadClick(Sender: TObject);
    procedure pmmRemoveClick(Sender: TObject);
    procedure tlListExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
      var Allow: Boolean);
  private
    FIgnList: TDSArray;
    FLangList: TStringList;
    FOnError: TLogEvent;
    FFullResList: TResourceList;
    filCount: Integer;
    fProfiles: TStringList;
    function ResetRelogin(idx: Integer): Boolean;
    procedure CreateResFields(rs: TResource);
    procedure SaveResFields;
    procedure LoginCallBack(Sender: TObject; N: Integer;
      Login, Password: String; const Cancel: Boolean);
    { Private declarations }
  public
    procedure ResetButtons;
    procedure SetLang;
    procedure GetLanguages;
    procedure LoadSettings;
    procedure ApplySettings;
    procedure OnClose;
    procedure CreateResources(ini: tinifile = nil);
    procedure OnErrorEvent(Sender: TObject; Msg: String; Data: Pointer);
    procedure JobStatus(Sander: TObject; Action: Integer);
    procedure LoadDoubles;
    function CheckDoublesName(rulename: string): Boolean;
    procedure LoadBlackList;
    procedure SaveBlackList;
    procedure ResetPosition;
    procedure LoadSkinList;
    procedure LoadProfiles;
    procedure SaveProfiles;
    procedure ReloadSettings;
    property OnError: TLogEvent read FOnError write FOnError;
    property FullResList: TResourceList read FFullResList;
    { Public declarations }
  end;

const
  def_items = 3;

implementation

uses UpdUnit, LangString, OpBase, utils, LoginForm, NewDoublesRuleForm;

{$R *.dfm}

var
  FLogedOn: Boolean = false;
  // FLoginCanceled: boolean = false;

procedure TfSettings.ApplySettings;
begin
  if pcMain.ActivePageIndex = 3 then
    SaveResFields;

  FillDSArray(FIgnList, IgnoreList);
  SaveBlackList;

  with GlobalSettings do
  begin
    UseBlackList := chbUseBlackList.Checked;
    AutoUPD := chbAutoUpdate.Checked;
    IncSkins := chbIncludeSkins.Checked;
    ShowWhatsNew := chbShowWhatsNew.Checked;
    UncheckBlacklisted := chbUncheckBlacklisted.EditValue;
    StopSignalTimer := eStopSignalTimer.EditValue;

    Proxy.UseProxy := cbProxy.ItemIndex;
    Proxy.ptype := tProxyType(cbProxyType.ItemIndex);
    Proxy.Host := eHost.Text;
    Proxy.Port := ePort.Value;
    Proxy.Auth := chbProxyAuth.Checked;
    Proxy.Login := eProxyLogin.Text;
    Proxy.Password := eProxyPassword.Text;
    Proxy.SavePWD := chbProxySavePWD.Checked;
    Proxy.UsePAC := chbPAC.Checked;

    if not SameText(Proxy.PACHost, ePACHost.Text) then
    begin
      Proxy.PACHost := trim(ePACHost.Text);
      dm.PACParser.Reload := true;
    end;

    Downl.ThreadCount := eThreads.Value;
    Downl.Retries := eRetries.Value;
    // Downl.Debug := chbDebug.Checked;

    Downl.UsePerRes := chbUseThreadPerRes.Checked;
    Downl.PerResThreads := eThreadPerRes.EditValue;
    Downl.PicThreads := ePicThreads.EditValue;

    idThrottler.BitsPerSec := eSpeed.Value * 8 * 1024;

    if (UseLookAndFeel <> chbUseLookAndFeel.Checked) or (SkinName <> cbSkin.Text)
    then
    begin
      UseLookAndFeel := chbUseLookAndFeel.Checked;
      if cbSkin.ItemIndex > 0 then
        SkinName := cbSkin.Text
      else
        SkinName := '';
      PostMessage(Application.MainForm.Handle, CM_STYLECHANGED, 0, 0);
    end;

    if MenuCaptions <> chbMenuCaptions.Checked then
    begin
      MenuCaptions := chbMenuCaptions.Checked;
      PostMessage(Application.MainForm.Handle, CM_MENUSTYLECHANGED, 0, 0);
    end;

    Tips := chbTips.Checked;
    UseDist := chbUseDistr.Checked;

  end;

  if (cbLanguage.ItemIndex > -1) and
    not SameText(FLangList[cbLanguage.ItemIndex], langname) then
  begin
    langname := FLangList[cbLanguage.ItemIndex];
    SetLogMode(chbLogMode.Checked);
    PostMessage(Application.MainForm.Handle, CM_LANGUAGECHANGED, 0, 0);
  end
  else if GLOBAL_LOGMODE <> chbLogMode.Checked then
  begin
    SetLogMode(chbLogMode.Checked);
    PostMessage(Application.MainForm.Handle, CM_LOGMODECHANGED, 0, 0);
  end;

end;

procedure TfSettings.bbDeleteRuleClick(Sender: TObject);
var
  N: Integer;
begin
  if tvDoubles.DataController.FocusedRecordIndex > -1 then
    if MessageDlg(lang('_DELETE_CONFIRM_'), mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      N := tvDoubles.DataController.FocusedRecordIndex;
      DeleteDSArrayRec(FIgnList, N);
      tvDoubles.DataController.DeleteRecord(N);
    end;
end;

procedure TfSettings.bbEditRuleClick(Sender: TObject);
var
  N: Integer;
  picfields: TStringList;
begin
  picfields := TStringList.Create;
  try
    FullResList.GetAllPictureFields(picfields);
    N := tvDoubles.DataController.FocusedRecordIndex;
    if (N > -1) and fmDoublesNewRule.Execute(FIgnList[N][0], FIgnList[N][1],
      picfields, CheckDoublesName) then
    begin
      // SetLength(FIgnlist,n);
      FIgnList[N][0] := fmDoublesNewRule.rulename;
      FIgnList[N][1] := trim(fmDoublesNewRule.ValueString, ';');
      tvDoubles.BeginUpdate;
      try
        // tvDoubles.DataController.RecordCount := n;
        tvDoubles.DataController.Values[N, cDoublesRuleName.index] :=
          FIgnList[N][0];
        tvDoubles.DataController.Values[N, cDoublesRules.index] :=
          ReplaceStr(FIgnList[N][1], ';', #13#10);
      finally
        tvDoubles.EndUpdate;
      end;
    end;
  finally
    picfields.Free;
  end;
end;

procedure TfSettings.bbNewRuleClick(Sender: TObject);
var
  picfields: TStringList;
  N: Integer;
begin
  N := tvDoubles.DataController.RecordCount + 1;
  picfields := TStringList.Create;
  try
    FullResList.GetAllPictureFields(picfields);
    if fmDoublesNewRule.Execute('rule' + IntToStr(N), '', picfields,
      CheckDoublesName) then
    begin
      SetLength(FIgnList, N);
      FIgnList[N - 1][0] := fmDoublesNewRule.rulename;
      FIgnList[N - 1][1] := trim(fmDoublesNewRule.ValueString, ';');
      tvDoubles.BeginUpdate;
      try
        tvDoubles.DataController.RecordCount := N;
        tvDoubles.DataController.Values[N - 1, cDoublesRuleName.index] :=
          FIgnList[N - 1][0];
        tvDoubles.DataController.Values[N - 1, cDoublesRules.index] :=
          ReplaceStr(FIgnList[N - 1][1], ';', #13#10);
      finally
        tvDoubles.EndUpdate;
      end;
      tvDoubles.DataController.FocusedRecordIndex := N - 1;
    end;
  finally
    picfields.Free;
  end;
end;

procedure TfSettings.bbDelBlackwordClick(Sender: TObject);
begin
  tvBlackList.DataController.DeleteFocused;
end;

procedure TfSettings.bbNewBlackwordClick(Sender: TObject);
begin
  tvBlackList.DataController.Append;

  tvBlackList.DataController.Values
    [tvBlackList.DataController.FocusedRecordIndex, 0] := 'tags';
  gBlackList.SetFocus;
end;

procedure TfSettings.btnApplyClick(Sender: TObject);
begin
  ApplySettings;
  SaveProfileSettings;
  if Assigned(FullResList) then
    SaveResourceSettings(FullResList);
  // SaveResourceSettings(
end;

procedure TfSettings.btnCancelClick(Sender: TObject);
begin
  PostMessage(Application.MainForm.Handle, CM_CANCELSETTINGS,
    Integer(Self.Parent), 0);
end;

procedure TfSettings.btnOkClick(Sender: TObject);
begin
  ApplySettings;
  PostMessage(Application.MainForm.Handle, CM_APPLYSETTINGS,
    Integer(Self.Parent), 0);
end;

procedure TfSettings.btnProfileClick(Sender: TObject);
begin
  pmProfile.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfSettings.cbProxyPropertiesChange(Sender: TObject);
begin
  ResetButtons;
end;

procedure TfSettings.chbProxyAuthPropertiesEditValueChanged(Sender: TObject);
begin
  eProxyLogin.Enabled := chbProxyAuth.Enabled and chbProxyAuth.Checked;
  eProxyPassword.Enabled := eProxyLogin.Enabled;
  chbProxySavePWD.Enabled := eProxyLogin.Enabled;
end;

procedure TfSettings.chbProxyPropertiesEditValueChanged(Sender: TObject);
begin
  eHost.Enabled := cbProxy.ItemIndex > 0;
  ePort.Enabled := eHost.Enabled;
  chbProxyAuth.Enabled := eHost.Enabled;
  eProxyLogin.Enabled := chbProxyAuth.Enabled and chbProxyAuth.Checked;
  eProxyPassword.Enabled := eProxyLogin.Enabled;
  chbProxySavePWD.Enabled := eProxyLogin.Enabled;
end;

procedure TfSettings.CreateResources;
var
  i, idx: Integer;
  item: TcxTreeListNode;
  bmp: tbitmap;
begin
  if not Assigned(FullResList) then
  begin
    FFullResList := TResourceList.Create;
    FFullResList.OnError := OnErrorEvent;
    FFullResList.OnJobChanged := JobStatus;
  end;

  if Assigned(ini) then
    dm.LoadFullResList(FFullResList, ini)
  else
    dm.LoadFullResList(FFullResList);

  tlList.Items[3].DeleteChildren;

  if filCount = 0 then
    filCount := il.Count
  else
    for i := il.Count - 1 downto filCount do
      il.Delete(il.Count - 1);

  bmp := tbitmap.Create;
  try
    for i := 1 to FullResList.Count - 1 do
    begin
      item := tlList.Items[3].AddChild;
      item.Values[0] := FullResList[i].Name;
      if FullResList[i].IconFile <> '' then
        bmp.LoadFromFile(rootdir + '\resources\icons\' + FullResList[i]
          .IconFile);
      idx := il.Add(bmp, nil);
      item.ImageIndex := idx;
    end;
  finally
    bmp.Free;
  end;
end;

procedure TfSettings.cxeAuthButtonPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  N: Integer;
begin
  N := tlList.FocusedNode.index + 1;
  Application.CreateForm(TfLogin, fLogin);
  fLogin.Execute(N, Format(lang('_LOGINON_'), [FullResList[N].Name]),
    nullstr(FullResList[N].Fields['login']),
    nullstr(FullResList[N].Fields['password']), LoginCallBack);
end;

procedure TfSettings.cxLabel5Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://code.google.com/p/nekopaw/', nil, nil,
    SW_SHOWNORMAL);
end;

procedure TfSettings.FrameClick(Sender: TObject);
begin
  filCount := 0;
end;

procedure TfSettings.GetLanguages;
var
  ini: tinifile;
  fs: TSearchRec;
  path: string;
begin
  if Assigned(FLangList) then
  begin
    cbLanguage.ItemIndex := FLangList.IndexOf(langname);
    Exit;
  end;

  FLangList := TStringList.Create;
  path := IncludeTrailingPathDelimiter(ExtractFilePath(paramstr(0)) +
    'languages');
  if FindFirst(path + '*.ini', faAnyFile, fs) = 0 then
    repeat
      FLangList.Add(ChangeFileExt(fs.Name, ''));
      ini := tinifile.Create(path + fs.Name);
      cbLanguage.Properties.Items.Add(ini.ReadString('lang', '_FILELANGUAGE_',
        ChangeFileExt(fs.Name, '')));
      ini.Free;
      if SameText(ChangeFileExt(fs.Name, ''), langname) then
        cbLanguage.ItemIndex := cbLanguage.Properties.Items.Count - 1;
    until FindNext(fs) <> 0;
end;

procedure TfSettings.lCheckNowClick(Sender: TObject);
begin
  btnApply.Click;
  PostMessage(Application.MainForm.Handle, CM_UPDATE, 3, 0);
end;

procedure TfSettings.lHelpClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://code.google.com/p/nekopaw/wiki/NekopawGUI',
    nil, nil, SW_SHOWNORMAL);
end;

procedure TfSettings.LoadBlackList;
var
  i: Integer;
begin
  if cBLComboBox.Properties.Items.Count = 0 then
  begin
    FullResList.GetAllPictureFields(cBLComboBox.Properties.Items);
    cBLComboBox.Properties.Items.Add('tags');
  end;

  gBlackList.BeginUpdate;
  try
    tvBlackList.DataController.RecordCount := Length(BlackList);

    for i := 0 to Length(BlackList) - 1 do
    begin
      tvBlackList.DataController.Values[i, 0] := BlackList[i][0];
      tvBlackList.DataController.Values[i, 1] := BlackList[i][1];
    end;

  finally
    gBlackList.EndUpdate;
  end;
end;

procedure TfSettings.LoadDoubles;
var
  i: Integer;
begin
  tvDoubles.BeginUpdate;
  try
    tvDoubles.DataController.RecordCount := Length(FIgnList);
    for i := 0 to Length(FIgnList) - 1 do
    begin
      tvDoubles.DataController.Values[i, cDoublesRuleName.index] :=
        FIgnList[i][0];
      tvDoubles.DataController.Values[i, cDoublesRules.index] :=
        ReplaceStr(FIgnList[i][1], ';', #13#10);
    end;
  finally
    tvDoubles.EndUpdate;
  end;
  if tvDoubles.DataController.RecordCount > 0 then
    tvDoubles.DataController.FocusedRowIndex := 0;
  BestFitWidths(tvDoubles);
end;

procedure TfSettings.LoadProfiles;
var
  N: tinifile;
  mi: TMenuItem;
  i: Integer;
begin
  if not Assigned(fProfiles) then
    fProfiles := TStringList.Create;
  N := tinifile.Create(IncludeTrailingPathDelimiter(rootdir) + 'settings.ini');
  try
    N.ReadSection('Profiles', fProfiles);
    for i := 0 to fProfiles.Count - 1 do
      fProfiles[i] := N.ReadString('Profiles', fProfiles[i], '');
  finally
    N.Free;
  end;

  if fProfiles.Count = 0 then
    fProfiles.Add(profname);

  for i := fProfiles.Count - 1 downto 0 do
  begin
    mi := pmProfile.CreateMenuItem;
    // mi.MenuIndex := 0;
    mi.Caption := fProfiles[i];
    if SameText(mi.Caption, profname) then
      mi.Default := true;
    mi.OnClick := pmmCaptionClick;
    pmProfile.Items.Insert(0, mi);
  end;
end;

procedure TfSettings.LoadSettings;
{ var
  resnames,skinnames: tstringlist; }
begin
  GetLanguages;
  LoadSkinList;
  FillDSArray(IgnoreList, FIgnList);
  LoadDoubles;
  if Assigned(FullResList) then
    LoadBlackList;
  with GlobalSettings do
  begin
    chbUseBlackList.Checked := UseBlackList;
    chbAutoUpdate.Checked := AutoUPD;
    chbIncludeSkins.Checked := IncSkins;
    chbShowWhatsNew.Checked := ShowWhatsNew;
    chbUseLookAndFeel.Checked := UseLookAndFeel;
    eStopSignalTimer.EditValue := StopSignalTimer;
    if SkinName = '' then
      cbSkin.ItemIndex := 0
    else
      cbSkin.Text := SkinName;
    chbMenuCaptions.Checked := MenuCaptions;
    chbTips.Checked := Tips;
    chbLogMode.Checked := GLOBAL_LOGMODE;
    chbUseDistr.Checked := UseDist;
    cbProxy.ItemIndex := Proxy.UseProxy;
    cbProxyType.ItemIndex := Integer(Proxy.ptype);
    eHost.Text := Proxy.Host;
    ePort.Value := Proxy.Port;
    chbProxyAuth.Checked := Proxy.Auth;
    eProxyLogin.Text := Proxy.Login;
    eProxyPassword.Text := Proxy.Password;
    chbProxySavePWD.Checked := Proxy.SavePWD;
    chbPAC.Checked := Proxy.UsePAC;
    ePACHost.Text := Proxy.PACHost;

    eThreads.Value := Downl.ThreadCount;
    eRetries.Value := Downl.Retries;

    chbUseThreadPerRes.Checked := Downl.UsePerRes;
    eThreadPerRes.EditValue := Downl.PerResThreads;
    ePicThreads.EditValue := Downl.PicThreads;
    eSpeed.Value := idThrottler.BitsPerSec / 1024 / 8;
    chbUncheckBlacklisted.EditValue := UncheckBlacklisted;
  end;

end;

procedure TfSettings.LoadSkinList;
var
  r: TSearchRec;
begin
  if cbSkin.Properties.Items.Count > 1 then
    Exit;

  if not DirectoryExists(ExtractFilePath(paramstr(0)) + 'skins\') then
    Exit;

  if FindFirst(ExtractFilePath(paramstr(0)) + 'skins\*.skinres', faAnyFile, r) = 0
  then
    repeat
      cbSkin.Properties.Items.Add(ChangeFileExt(r.Name, ''));
    until FindNext(r) <> 0;
end;

procedure TfSettings.OnClose;
begin
  if Assigned(FLangList) then
    FLangList.Free;
  // FullResList.OnError := nil;
  // FullResList.OnJobChanged := nil;
  FullResList.Free;
end;

procedure TfSettings.ReloadSettings;
begin
  with GlobalSettings do
  begin
    if not SameText(Proxy.PACHost, ePACHost.Text) then
      dm.PACParser.Reload := true;

    if (UseLookAndFeel <> chbUseLookAndFeel.Checked) or (SkinName <> cbSkin.Text)
    then
      PostMessage(Application.MainForm.Handle, CM_STYLECHANGED, 0, 0);

    if MenuCaptions <> chbMenuCaptions.Checked then
      PostMessage(Application.MainForm.Handle, CM_MENUSTYLECHANGED, 0, 0);
  end;

  if (cbLanguage.ItemIndex > -1) and
    not SameText(FLangList[cbLanguage.ItemIndex], langname) then
  begin
    // langname := FLangList[cbLanguage.ItemIndex];
    SetLogMode(chbLogMode.Checked);
    PostMessage(Application.MainForm.Handle, CM_LANGUAGECHANGED, 0, 0);
  end
  else if GLOBAL_LOGMODE <> chbLogMode.Checked then
  begin
    SetLogMode(chbLogMode.Checked);
    PostMessage(Application.MainForm.Handle, CM_LOGMODECHANGED, 0, 0);
  end;
  LoadSettings;
end;

procedure TfSettings.ResetButtons;
begin
  // cbProxyType.Enabled := cbProxy.ItemIndex > 0;
  // eHost.Enabled := cbProxyType.Enabled;
  // ePort.Enabled := eHost.Enabled;
  // chbProxyAuth.Enabled := eHost.Enabled;
  eProxyLogin.Enabled := { chbProxyAuth.Enabled and } chbProxyAuth.Checked;
  eProxyPassword.Enabled := eProxyLogin.Enabled;
  chbProxySavePWD.Enabled := eProxyLogin.Enabled;

  // chbHideToTray.Enabled := chbTrayIcon.Checked and chbTrayIcon.Enabled;
end;

procedure TfSettings.ResetPosition;
const
  // _cbwidth = 139;
  _space = 15;
  _defcap = 250;

var
  lcap: Integer;

  procedure chkw(v: tcxcustomedit);
  begin
    if v is TcxCheckBox then
      with v as TcxCheckBox do
        // begin
        Width := canvas.TextWidth(Caption) + 24;
    // end;
  end;

  procedure getw(l: tcxcustomedit; cb: tcxcustomedit = nil);
  var
    lw: Integer;
  begin
    if l is TcxLabel then
      with l as TcxLabel do
        lw := canvas.TextWidth(Caption)
    else if l is TcxCheckBox then
      with l as TcxCheckBox do
        lw := canvas.TextWidth(Caption)
    else
      lw := 0;

    if Assigned(cb) then
      if lw + _space + cb.Width > lcap then
        lcap := lw + _space + cb.Width
      else
    else if lw > lcap then
      lcap := lw;
  end;

  procedure setw(l: tcxcustomedit; cb: tcxcustomedit = nil;
    l2: tcxcustomedit = nil);
  begin
    if Assigned(cb) then
    begin
      cb.Left := lcap - cb.Width;
      if Assigned(l2) then
        l2.Left := lcap + 4;
    end
    else
    begin

    end;
  end;

begin
  // pcMain.Properties.BeginUpdate; try

  { page1 }

  lcap := _defcap;
  getw(lcLanguage, cbLanguage);
  chkw(chbAutoUpdate); // getw(chbAutoupdate);
  chkw(chbIncludeSkins);
  getw(lCheckNow);
  chkw(chbShowWhatsNew); // getw(chbShowWhatsNew);
  getw(lSkin, cbSkin);
  chkw(chbUseLookAndFeel); // getw(chbUseLookAndFeel);
  chkw(chbMenuCaptions); // getw(chbMenuCaptions);
  chkw(chbTips); // getw(chbTips);
  chkw(chbLogMode); // getw(chbLogMode);

  setw(lcLanguage, cbLanguage);
  setw(lSkin, cbSkin);

  { page2 }

  lcap := _defcap;
  getw(lcThreads, eThreads);
  chkw(chbUseThreadPerRes); // getw(chbuseThreadPerRes);
  getw(lcThreadPerRes, eThreadPerRes);
  getw(lcPicThreads, ePicThreads);
  getw(lcRetries, eRetries);
  getw(lcSpeed, eSpeed);
  getw(lcStopSignalTimer, eStopSignalTimer);
  chkw(chbUseDistr); // getw(chbUseDistr);

  setw(lcThreads, eThreads);
  setw(lcThreadPerRes, eThreadPerRes);
  setw(lcPicThreads, ePicThreads);
  setw(lcRetries, eRetries);
  setw(lcSpeed, eSpeed, cxLabel6);
  setw(lcStopSignalTimer, eStopSignalTimer);
  { page3 }

  lcap := _defcap;
  getw(lblProxy, cbProxy);
  getw(lblProxyType, cbProxyType);
  getw(lcProxyHost, eHost);
  getw(lcProxyPort, ePort);
  chkw(chbProxyAuth);
  getw(lcProxyLogin, eProxyLogin);
  getw(lcProxyPassword, eProxyPassword);
  // getw(lblPACHost);
  chkw(chbPAC);

  setw(lblProxy, cbProxy);
  setw(lblProxyType, cbProxyType);
  setw(lcProxyHost, eHost);
  setw(lcProxyPort, ePort);
  setw(lcProxyLogin, eProxyLogin);
  setw(lcProxyPassword, eProxyPassword);
  chbProxySavePWD.Left := eProxyPassword.Left;
  // setw(ePACFile,btnPACFile);
  ePACHost.Width := lcap - 4;
  // btnPACFile.Left := lcap - btnPACFile.Width + 4;

  // finally
  // pcMain.Properties.EndUpdate;
  // end;
end;

procedure TfSettings.SetLang;
var
  N: Integer;
begin
  // gpWork.Caption := _WORK_;
  pcMain.Properties.BeginUpdate;
  try
    cxLabel1.Caption := 'About ' + Application.MainForm.Caption;
    btnOk.Caption := lang('_OK_');
    btnCancel.Caption := lang('_CANCEL_');
    btnApply.Caption := lang('_APPLY_');
    btnProfile.Caption := lang('_PROFILE_');
    pmmSave.Caption := lang('_SAVEASNEW_');
    pmmLoad.Caption := lang('_LOADFROMFILE_');
    pmmRemove.Caption := lang('_REMOVEFROMLIST_');
    lcThreads.Caption := lang('_THREAD_COUNT_');
    chbUseThreadPerRes.Caption := lang('_USE_PER_RES_');
    lcThreadPerRes.Caption := lang('_PER_RES_');
    lcPicThreads.Caption := lang('_PIC_THREADS_');
    lcRetries.Caption := lang('_RETRIES_');
    lcProxyHost.Caption := lang('_HOST_');
    lcProxyPort.Caption := lang('_PORT_');
    lcProxyLogin.Caption := lang('_LOGIN_');
    lcProxyPassword.Caption := lang('_PASSWORD_');
    lcSpeed.Caption := lang('_SPEED_');
    lcLanguage.Caption := lang('_LANGUAGE_');
    lcStopSignalTimer.Caption := lang('_STOPSIGNALTIMER_');
    tlList.Items[0].Texts[0] := lang('_INTERFACE_');
    tlList.Items[1].Texts[0] := lang('_THREADS_');
    tlList.Items[2].Texts[0] := lang('_PROXY_');
    tlList.Items[3].Texts[0] := lang('_RESOURCES_');
    tlList.Items[4].Texts[0] := lang('_DOUBLES_');
    tlList.Items[5].Texts[0] := lang('_BLACKLIST_');
    tlList.Items[6].Texts[0] := lang('_ABOUT_');
    // chbDebug.Caption := _DEBUGMODE_;
    // gpProxy.Caption := _PROXY_;
    lblProxy.Caption := lang('_USE_PROXY_');
    N := cbProxy.ItemIndex;
    cbProxy.Properties.BeginUpdate;
    try
      cbProxy.Properties.Items[0] := lang('_PROXY_DISABLED_');
      cbProxy.Properties.Items[1] := lang('_PROXY_ALWAYS_');
      cbProxy.Properties.Items[2] := lang('_PROXY_LIST_');
      cbProxy.Properties.Items[3] := lang('_PROXY_PICS_');

    finally
      cbProxy.ItemIndex := N;
      cbProxy.Properties.EndUpdate;
    end;
    lblProxyType.Caption := lang('_PROXY_TYPE_');
    cbProxyType.Properties.BeginUpdate;
    try
      cbProxyType.Properties.Items[0] := lang('_PROXY_HTTP_');
      cbProxyType.Properties.Items[1] := lang('_PROXY_SOCKS4_');
      cbProxyType.Properties.Items[2] := lang('_PROXY_SOCKS5_');
    finally
      cbProxyType.Properties.EndUpdate;
    end;
    chbProxyAuth.Caption := lang('_AUTHORISATION_');
    chbProxySavePWD.Caption := lang('_SAVE_PASSWORD_');
    chbPAC.Caption := lang('_PAC_');
    // lblPACHost.Caption := lang('_PACHOST_');
    chbAutoUpdate.Caption := lang('_AUTOUPDATE_');
    chbIncludeSkins.Caption := lang('_INCLUDESKINS_');
    lCheckNow.Caption := lang('_UPDATENOW_');
    chbShowWhatsNew.Caption := lang('_SHOW_WHATSNEW_');
    chbUseLookAndFeel.Caption := lang('_USELOOKANDFEEL_');
    lSkin.Caption := lang('_SKIN_');
    bbNewRule.Caption := lang('_CREATERULE_');
    bbEditRule.Caption := lang('_EDITRULE_');
    bbDeleteRule.Caption := lang('_DELETERULE_');
    bbNewBlackword.Caption := lang('_NEWBW_');
    bbDelBlackword.Caption := lang('_DELETEBW_');
    cDoublesRuleName.Caption := lang('_RULENAME_');
    cDoublesRules.Caption := lang('_RULESTRING_');
    chbMenuCaptions.Caption := lang('_MENUCAPTIONS_');
    chbTips.Caption := lang('_SHOWTIPS_');
    lHelp.Caption := lang('_HELP_');
    chbLogMode.Caption := lang('_LOGMODE_');
    chbUseDistr.Caption := lang('_USERESDISTR_');
    chbUseBlackList.Caption := lang('_USEBLACKLIST_');
    chbUncheckBlacklisted.Caption := lang('_UNCHECKBLACKLISTED_');
    chbUncheckBlacklisted.Hint := chbUncheckBlacklisted.Caption;

    ResetPosition;
  finally
    pcMain.Properties.EndUpdate;
  end;
end;

procedure TfSettings.tlListExpanding(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
  if not Assigned(FullResList) then
    CreateResources;
end;

procedure TfSettings.tlListFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if AFocusedNode.Parent = tlList.Root then
  begin
    if (AFocusedNode.index in [3,5]) and not Assigned(FullResList) then
    begin
      CreateResources;
      LoadBlackList;
    end;
    pcMain.ActivePageIndex := AFocusedNode.index;
  end
  else if AFocusedNode.Parent = tlList.Items[3] then
  begin
    if not Assigned(FullResList) then
      CreateResources;
    pcMain.ActivePageIndex := 3;
  end;

  try
    if Assigned(APrevFocusedNode) and ((APrevFocusedNode = tlList.Items[3]) or
      (APrevFocusedNode.Parent = tlList.Items[3])) then
      SaveResFields;

  finally
    if (AFocusedNode = tlList.Items[3]) then
      CreateResFields(FullResList[0])
    else if (AFocusedNode.Parent = tlList.Items[3]) then
      CreateResFields(FullResList[AFocusedNode.index + 1]);
  end;
end;

function TfSettings.CheckDoublesName(rulename: string): Boolean;
var
  i: Integer;
begin
  for i := 0 to Length(FIgnList) - 1 do
    if (i <> tvDoubles.DataController.FocusedRecordIndex) and
      SameText(rulename, FIgnList[i][0]) then
    begin
      Result := true;
      Exit;
    end;
  Result := false;
end;

procedure TfSettings.CreateResFields(rs: TResource);
var
  c: TcxCategoryRow;
  r: TcxCustomRow;
  i, d: Integer;
  s: string;

begin
  {
    if vgSettings.Rows.Count > 0 then
    SaveResFields;
  }
  vgSettings.BeginUpdate;
  try
    vgSettings.ClearRows;
    vgSettings.Tag := Integer(rs);
    if rs = FullResList[0] then
    begin
      c := dm.CreateCategory(vgSettings, 'vgimain', lang('_MAINCONFIG_'));
      // dm.CreateField(vgSettings,'vgitag',_TAGSTRING_,'',ftString,c,FullResList[n].Fields['tag']);
      dm.CreateField(vgSettings, 'vgidwpath', lang('_SAVEPATH_'), '',
        ftPathText, c, rs.NameFormat);
      // dm.CreateField(vgSettings, 'vgisdalf', lang('_SDALF_'), '', ftCheck, c,
      // GlobalSettings.Downl.SDALF);
      dm.CreateField(vgSettings, 'vgiautounch', lang('_AUTOUNCHECKINVISIBLE_'),
        '', ftCheck, c, GlobalSettings.Downl.AutoUncheckInvisible);
      dm.CreateField(vgSettings, 'vgiexif', lang('_WRITEEXIF_'), '', ftCheck, c,
        GlobalSettings.WriteEXIF);
    end
    else
      with rs do
      begin
        c := dm.CreateCategory(vgSettings, 'vgimain', lang('_MAINCONFIG_') + ' '
          + rs.Name);
        dm.CreateField(vgSettings, 'vgiinherit', lang('_INHERIT_'), '', ftCheck,
          c, Inherit);

        { s := VarToStr(Fields['tag']);
          if (s = '') and Inherit then
          s := VarToStr(FullResList[0].Fields['tag']);
          dm.CreateField(vgSettings,'vgitag',_TAGSTRING_,'',ftString,c,s); }

        s := NameFormat;
        if (s = '') or Inherit then
          s := FullResList[0].NameFormat;
        dm.CreateField(vgSettings, 'vgidwpath', lang('_SAVEPATH_'), '',
          ftPathText, c, s);

        { c := dm.CreateCategory(vgSettings,'vgiauth',lang('_AUTHORISATION_'),true);
          dm.CreateField(vgSettings,'vgilogin',lang('_LOGIN_'),'',ftString,c,
          FullResLIst[n].Fields['login']);
          dm.CreateField(vgSettings,'vgipassword',lang('_PASSWORD_'),'',ftPassword,c,
          FullResLIst[n].Fields['password']); }

        (dm.CreateField(vgSettings, 'vgiauth', lang('_AUTHORISATION_'), '',
          ftString, c, '') as tcxEditorRow).Properties.RepositoryItem :=
          eAuthButton;

        d := FullResList[0].Fields.Count;

        c := nil;
        r := nil;

        if rs.Fields.Count > d then
          with rs.Fields do
          begin
            for i := d to Count - 1 do
              if Items[i].restype <> ftNone then
              begin
                c := dm.CreateCategory(vgSettings, 'vgieditional',
                  lang('_EDITIONALCONFIG_'));
                // d := i;
                Break;
              end
              else
                inc(d);

            for i := d to Count - 1 do
              if Items[i].restype <> ftNone then
                with rs.Fields.Items[i]^ do
                  if InMulti then
                    dm.CreateField(vgSettings, 'evgi' + resname, restitle,
                      resitems, restype, r, resvalue)
                  else
                    r := dm.CreateField(vgSettings, 'evgi' + resname, restitle,
                      resitems, restype, c, resvalue);

          end;

        c := dm.CreateCategory(vgSettings, 'vgispecial',
          lang('_SPECIALSETTINGS_'));
        if not ThreadCounter.UseUserSettings and (ThreadCounter.UseProxy = -1)
        then
          c.Expanded := false;

        dm.CreateField(vgSettings, 'vgiproxy', lang('_USE_PROXY_'),
          lang('_PROXY_DEFAULT_') + ',' + lang('_PROXY_DISABLED_') + ',' +
          lang('_PROXY_ALWAYS_') + ',' + lang('_PROXY_LIST_') + ',' +
          lang('_PROXY_PICS_'), ftIndexCombo, c, ThreadCounter.UseProxy + 1);

        dm.CreateField(vgSettings, 'vgiinheritstt', lang('_OWNSETTINGS_'), '',
          ftCheck, c, ThreadCounter.UseUserSettings);
        dm.CreateField(vgSettings, 'vgithreadcount', lang('_THREAD_COUNT_'), '',
          ftNumber, c, ThreadCounter.UserSettings.MaxThreadCount);
        dm.CreateField(vgSettings, 'vgithreaddelay', lang('_QUERY_DELAY_'), '',
          ftNumber, c, ThreadCounter.UserSettings.PageDelay);
        dm.CreateField(vgSettings, 'vgipicdelay', lang('_PIC_DELAY_'), '',
          ftNumber, c, ThreadCounter.UserSettings.PicDelay);

      end;
  finally
    vgSettings.EndUpdate;
  end;
end;

procedure TfSettings.SaveBlackList;
var
  i: Integer;
  l: Integer;
begin
  if not Assigned(FullResList) then
    Exit;

  SetLength(BlackList, 0);
  l := 0;
  with tvBlackList.DataController do
    for i := 0 to RecordCount - 1 do
      if (Values[i, 0] <> '') and (Values[i, 1] <> '') then
      begin
        SetLength(BlackList, l + 1);
        BlackList[l, 0] := Values[i, 0];
        BlackList[l, 1] := lowercase(Values[i, 1]);
        inc(l);
      end;
end;

procedure TfSettings.SaveProfiles;
var
  N: tinifile;
  i: Integer;
begin
  N := tinifile.Create(IncludeTrailingPathDelimiter(rootdir) + 'settings.ini');
  try
    N.EraseSection('Profiles');
    for i := 0 to fProfiles.Count - 1 do
      N.WriteString('Profiles', 'Item' + IntToStr(i), fProfiles[i]);

  finally
    N.Free;
  end;
end;

procedure TfSettings.SaveResFields;
var
  i, d: Integer;
  r: tcxMyMultiEditorRow;
  rs: TResource;
begin
  if not Assigned(FullResList) then
    Exit;

  rs := TResource(vgSettings.Tag);
  rs.IsNew := true;
  with rs do
  begin
    { Fields['tag'] := (vgSettings.RowByName('vgitag') as TcxEditorRow)
      .Properties.Value; }

    NameFormat := (vgSettings.RowByName('vgidwpath') as tcxEditorRow)
      .Properties.Value;

    if rs = FullResList[0] then
    begin
      // GlobalSettings.Downl.SDALF :=
      // (vgSettings.RowByName('vgisdalf') as tcxEditorRow).Properties.Value;
      GlobalSettings.Downl.AutoUncheckInvisible :=
        (vgSettings.RowByName('vgiautounch') as tcxEditorRow).Properties.Value;

      GlobalSettings.WriteEXIF :=
        (vgSettings.RowByName('vgiexif') as tcxEditorRow).Properties.Value;

    end
    else
    begin
      Inherit := (vgSettings.RowByName('vgiinherit') as tcxEditorRow)
        .Properties.Value;

      { Fields['login'] := (vgSettings.RowByName('vgilogin') as TcxEditorRow)
        .Properties.Value;

        Fields['password'] := (vgSettings.RowByName('vgipassword') as TcxEditorRow)
        .Properties.Value; }

      d := FullResList[0].Fields.Count;
      r := nil;

      if Fields.Count > d then
        with Fields do
          for i := d to Count - 1 do
            if Items[i].restype <> ftNone then
            begin
              case Items[i].restype of
                ftMultiEdit:
                  r := vgSettings.RowByName('evgi' + Items[i].resname)
                    as tcxMyMultiEditorRow;
                ftIndexCombo:
                  if Items[i].InMulti then
                    Items[i].resvalue := IndexOfStr(Items[i].resitems,
                      r.Properties.Editors[StrToInt(CopyFromTo(Items[i].resname,
                      '[', ']', [], [])) - 1].Value)
                  else
                    Items[i].resvalue := IndexOfStr(Items[i].resitems,
                      (vgSettings.RowByName('evgi' + Items[i].resname)
                      as tcxEditorRow).Properties.Value)
              else
                if Items[i].InMulti then
                  Items[i].resvalue := r.Properties.Editors
                    [StrToInt(CopyFromTo(Items[i].resname, '[', ']', [], []))
                    - 1].Value
                else
                  Items[i].resvalue :=
                    (vgSettings.RowByName('evgi' + Items[i].resname)
                    as tcxEditorRow).Properties.Value;
              end;
            end;

      ThreadCounter.UseProxy := IndexOfStr(lang('_PROXY_DEFAULT_') + ',' +
        lang('_PROXY_DISABLED_') + ',' + lang('_PROXY_ALWAYS_') + ',' +
        lang('_PROXY_LIST_') + ',' + lang('_PROXY_PICS_'),
        (vgSettings.RowByName('vgiproxy') as tcxEditorRow)
        .Properties.Value) - 1;

      ThreadCounter.UseUserSettings :=
        (vgSettings.RowByName('vgiinheritstt') as tcxEditorRow)
        .Properties.Value;

      ThreadCounter.UserSettings.MaxThreadCount :=
        (vgSettings.RowByName('vgithreadcount') as tcxEditorRow)
        .Properties.Value;

      ThreadCounter.UserSettings.PageDelay :=
        (vgSettings.RowByName('vgithreaddelay') as tcxEditorRow)
        .Properties.Value;

      ThreadCounter.UserSettings.PicDelay :=
        (vgSettings.RowByName('vgipicdelay') as tcxEditorRow).Properties.Value;

    end;
  end;
end;

procedure TfSettings.LoginCallBack(Sender: TObject; N: Integer;
  Login, Password: String; const Cancel: Boolean);
begin
  if Cancel then
  begin
    FLogedOn := false;
    if not FullResList.ListFinished then
    begin
      SetConSettings(FullResList);
      FullResList.StartJob(JOB_STOPLIST);
    end
    else
      fLogin.Close;
  end
  else
  begin
    FullResList[N].Fields['login'] := Login;
    FullResList[N].Fields['password'] := Password;
    if ResetRelogin(N) then
    begin
      FLogedOn := true;
      FullResList.StartJob(JOB_LOGIN);
    end
    else
      fLogin.Close;
  end;
end;

function TfSettings.ResetRelogin(idx: Integer): Boolean;
var
  i: Integer;
  // N: TResource;
begin
  Result := false;
  for i := 0 to FullResList.Count - 1 do
    Result := Result or FullResList[i].ResetRelogin;

  // N := FullResList[idx { tvRes.DataController.Values[idx, 0] } ];
  // if (N.ScriptStrings.Login <> '') or (N.HTTPRec.CookieStr <> '') and
  // (N.LoginPrompt or (nullstr(N.Fields['login']) <> '')) then
  // begin
  // N.Relogin := true;
  // Result := true;
  // end;
end;

procedure TfSettings.OnErrorEvent(Sender: TObject; Msg: String; Data: Pointer);
begin
  if FLogedOn then
    FLogedOn := false;
  if Assigned(FOnError) then
    FOnError(Sender, Msg, Data);
end;

procedure TfSettings.pmmCaptionClick(Sender: TObject);
begin
  if SameText((Sender as TMenuItem).Caption, profname) then
    Exit;

  // profname := (Sender as TMenuItem).Caption;
  (Sender as TMenuItem).Default := true;
  LoadProfileSettings((Sender as TMenuItem).Caption);
  CreateResources;
  ReloadSettings;
  SaveCurrentProfile;
  // ApplySettings;
end;

procedure TfSettings.pmmLoadClick(Sender: TObject);
var
  ini: tinifile;
  mi: TMenuItem;
begin
  if dlgOpen.Execute then
  begin
    ini := tinifile.Create(dlgOpen.FileName);
    try
      profname := ChangeFileExt(ExtractFileName(dlgOpen.FileName), '.ini');
      LoadProfileSettings(ini);
      CreateResources;
      ReloadSettings;
      // profname := s;
      SaveProfileSettings;
      mi := pmProfile.CreateMenuItem;
      mi.Caption := profname;
      pmProfile.Items.Insert(fProfiles.Add(profname), mi);
      mi.Default := true;
      mi.OnClick := pmmCaptionClick;

      SaveProfiles;
    finally
      ini.Free;
    end;

  end;

end;

procedure TfSettings.pmmRemoveClick(Sender: TObject);
var
  N: Integer;
begin
  N := fProfiles.IndexOf(profname);
  if N = -1 then
    Exit;

  fProfiles.Delete(N);
  pmProfile.Items.Delete(N);
  SaveProfiles;
  pmProfile.Items[0].Click;
end;

procedure TfSettings.pmmSaveClick(Sender: TObject);
var
  mi: TMenuItem;
  s: string;
begin
  s := trim(InputBox(lang('_SAVEASNEW_'), lang('_NEWNAME_'), profname));
  if SameText(s, profname) or (Length(s) = 0) then
    Exit;

  if not SameText(ExtractFileExt(s), '.ini') then
    s := s + '.ini';

  profname := s;
  SaveProfileSettings;
  mi := pmProfile.CreateMenuItem;
  mi.Caption := profname;
  pmProfile.Items.Insert(fProfiles.Add(profname), mi);
  mi.Default := true;
  mi.OnClick := pmmCaptionClick;

  SaveProfiles;
end;

procedure TfSettings.JobStatus(Sander: TObject; Action: Integer);
begin
  if Action = JOB_STOPLIST then
    if Assigned(fLogin) then
      if FLogedOn or FullResList.Canceled then
        fLogin.Close
      else
        fLogin.bOk.Enabled := true;
end;

end.
