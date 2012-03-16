﻿unit MainForm;

interface

uses
  {base}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, ExtCtrls, DateUtils, ImgList, Commctrl, rpVersionInfo,
  AppEvnts, Types, ShellAPI,
  {devex}
  dxDockControl, dxDockPanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsdxDockControlPainter,
  cxCheckBox, cxTextEdit, cxPC, dxBar, dxBarExtItems, cxContainer,
  cxMemo,dxsbar, cxListBox, dxNavBarCollns,dxNavBarBase, dxNavBar,
  cxInplaceContainer, cxVGrid, cxCheckListBox, cxLabel,
  {graber2}
  common, OpBase, graberU, MyHTTP, UPDUnit;

type

  TMycxTabSheet = class(TcxTabSheet)
    private
      FTimer: TTimer;
      FStartFrame,FEndFrame,FCurrentFrame: Integer;
      FLoop: Boolean;
      FRName: String;
      procedure OnTimer(Sender: TObject);
    public
      MainFrame: TFrame;
      SecondFrame: TFrame;
      property RName: String read FRName write FRName;
      procedure SetIcon(AStartFrame: integer; AEndFrame: integer = -1;
      Loop: boolean = false);
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  end;

  TcxTabSheetEvent = procedure(ASender: TObject; ATabSheet: TcxTabSheet)
    of object;

  TcxPageControl = class(cxPC.TcxPageControl)
  private
    FOnPageClose: TcxTabSheetEvent;
  protected
    procedure DoClose; override;
  public
    property OnPageClose: TcxTabSheetEvent read FOnPageClose write FOnPageClose;
  end;

  { TmycxOnGetExpandable = procedure(MasterDataRow: TcxGridMasterDataRow;
    var Expandable: Boolean) of object;

    TmycxGridTableView = class(TcxGridTableView)
    private
    protected
    function GetViewDataClass: TcxCustomGridViewDataClass; override;
    public
    OnGetExpandable: TmycxOnGetExpandable;
    constructor Create(AOwner: TComponent); override;
    end;

    TmycxGridViewData = class(TcxGridViewData)
    protected
    function GetRecordClass(ARecordInfo: TcxRowInfo)
    : TcxCustomGridRecordClass; override;
    end;

    TmycxGridMasterDataRow = class(TcxGridMasterDataRow)
    protected
    function GetExpandable: Boolean; override;
    end; }

  // TmfState = (msStart, msNewList, msGrid, msSettings);

  Tmf = class(TForm)
    ActionList: TActionList;
    aLLoad: TAction;
    aSettings: TAction;
    aIAdvanced: TAction;
    aISimple: TAction;
    aLApplyNew: TAction;
    aLCancel: TAction;
    ds: TdxDockSite;
    DockManager: TdxDockingManager;
    BarManager: TdxBarManager;
    bmbMain: TdxBar;
    dpTable: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dpTags: TdxDockPanel;
    dpCurTags: TdxDockPanel;
    dsTable: TdxLayoutDockSite;
    dsTags: TdxTabContainerDockSite;
    dpLog: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dpErrors: TdxDockPanel;
    dsLogs: TdxTabContainerDockSite;
    pcTables: TcxPageControl;
    bbStartList: TdxBarButton;
    bbStartPics: TdxBarButton;
    bbSettings: TdxBarButton;
    bbNew: TdxBarButton;
    il: TcxImageList;
    cxLookAndFeelController1: TcxLookAndFeelController;
    mLog: TcxMemo;
    mErrors: TcxMemo;
    ApplicationEvents1: TApplicationEvents;
    nvCur: TdxNavBar;
    nbgCurMain: TdxNavBarGroup;
    nbgCurTags: TdxNavBarGroup;
    nbgCurMainControl: TdxNavBarGroupControl;
    vgCurMain: TcxVerticalGrid;
    nbgCurTagsControl: TdxNavBarGroupControl;
    chlbTags: TcxCheckListBox;
    vINFO: TrpVersionInfo;
    lUPD: TcxLabel;
    testo: TdxBarButton;
    BalloonHint: TBalloonHint;
    aftertimer: TTimer;
    nvTags: TdxNavBar;
    nbgTagsMain: TdxNavBarGroup;
    nbgTagsTags: TdxNavBarGroup;
    dxNavBarGroupControl1: TdxNavBarGroupControl;
    vgTagsMain: TcxVerticalGrid;
    dxNavBarGroupControl2: TdxNavBarGroupControl;
    cxCheckListBox1: TcxCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gLevel2GetGridView(Sender: TcxGridLevel;
      AMasterRecord: TcxCustomGridRecord; var AGridView: TcxCustomGridView);
    procedure bbSettingsClick(Sender: TObject);
    procedure bbNewClick(Sender: TObject);
    procedure pcTablesChange(Sender: TObject);
    procedure bbStartListClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure bbStartPicsClick(Sender: TObject);
    procedure pcTablesPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure testoClick(Sender: TObject);
  private
    mFrame: TFrame;
    FOldCaption: String;
    // tvMain: TmycxGridTableView;
  protected
//    procedure EXPANDROW(var Msg: TMessage); message CM_EXPROW;
    procedure NEWLIST(var Msg: TMessage); message CM_NEWLIST;
    procedure APPLYNEWLIST(var Msg: TMessage); message CM_APPLYNEWLIST;
    procedure CANCELNEWLIST(var Msg: TMessage); message CM_CANCELNEWLIST;
    procedure SHOWSETTINGS(var Msg: TMessage); message CM_SHOWSETTINGS;
    procedure CANCELSETTINGS(var Msg: TMessage); message CM_CANCELSETTINGS;
    procedure APPLYSETTINGS(var Msg: TMessage); message CM_APPLYSETTINGS;
    procedure STARTJOB(var Msg: TMessage); message CM_STARTJOB;
    procedure ENDJOB(var Msg: TMessage); message CM_ENDJOB;
    procedure UPDATECHECK(var Msg: TMessage); message CM_UPDATE;
    procedure LANGUAGECHANGED(var Msg: TMessage); message CM_LANGUAGECHANGED;
    procedure dxTabClose(Sender: TdxCustomDockControl);
    // procedure APPLYEDITLIST(var Msg: TMessage); message CM_APPLYNEWLIST;
  private
    TabList: TList;
    dsFirstShow: Boolean;
    SttPanel: TMycxTabSheet;
    FCookie: TMyCookieList;
    CurPic: TTPicture;
    { Private declarations }
  public
    // OldState: TmfState;
    { procedure tvMainRecordExpandable(MasterDataRow: TcxGridMasterDataRow;
      var Expandable: Boolean); }
    function CreateTab(pc: TcxPageControl; Enc: boolean = true): TMycxTabSheet;
    procedure ShowDs;
    procedure HideDs;
    procedure CloseTab(t: TcxTabSheet);
    procedure OnTabClose(ASender: TObject; ATabSheet: TcxTabSheet);
    procedure ShowPanels;
    procedure OnError(Sender: TObject; Msg: String);
    procedure Setlang;
    procedure PicInfo(Sender: TObject; a: TTPicture);
    procedure CheckUpdates;
    procedure ShowUPDHint(title, description: string);
    procedure StartUpdate;
    procedure ChangeResInfo;
    procedure RefreshResInfo(Sender: TObject);

    { Public declarations }
  end;

var
  mf: Tmf;
  hWndTip: THandle;

implementation

uses StartFrame, NewListFrame, LangString, SettingsFrame, GridFrame, utils,
  AboutForm, WaitForm;
{$R *.dfm}

procedure TMycxTabSheet.OnTimer(Sender: TObject);
begin
  inc(FCurrentFrame);
  if FCurrentFrame > FEndFrame then
  begin
    FCurrentFrame := FStartFrame;
    if not FLoop then
      FTimer.Enabled := false;
  end;
  ImageIndex := FCurrentFrame;
end;

procedure TMycxTabSheet.SetIcon(AStartFrame: integer; AEndFrame: integer = -1;
      Loop: boolean = false);
begin
  //FTimer.Enabled := false;

{  FStartFrame := AStartFrame;
  FLoop := Loop;
  if not FTimer.Enabled or FTimer.Enabled and (AEndFrame > -1)
  and (FCurrentFrame < FStartFrame) then
    FCurrentFrame := FStartFrame;
  if (AEndFrame > -1) then
    FEndFrame := AEndFrame;
  if (ImageIndex <> FStartFrame) or (AEndFrame > -1) then
    FTimer.Enabled := true;   }
  ImageIndex := FStartFrame;
end;

constructor TMycxTabSheet.Create(AOwner: TComponent);
begin
  inherited;
  MainFrame := nil;
  SecondFrame := nil;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.Interval := 50;
  FTimer.OnTimer := OnTimer;
  FLoop := false;
end;

destructor TMycxTabSheet.Destroy;
begin
  FTimer.Free;
{  if Assigned(MainFrame) then
  begin
    if (MainFrame is TfGrid) then
      (MainFrame as TfGrid).Relise;
    MainFrame.Free;
  end;
  if Assigned(SecondFrame) then
    SecondFrame.Free;    }
  inherited;
end;

procedure TcxPageControl.DoClose;
begin
  if Assigned(FOnPageClose) then
    FOnPageClose(Self, ActivePage)
  else
    inherited;
end;

{ TmycxGridTableView }

{ constructor TmycxGridTableView.Create(AOwner: TComponent);
  begin
  inherited Create(AOwner);
  OnGetExpandable := nil;
  end;

  function TmycxGridTableView.GetViewDataClass: TcxCustomGridViewDataClass;
  begin
  Result := TmycxGridViewData;
  end; }

{ TmycxGridViewData }

{ function TmycxGridViewData.GetRecordClass(ARecordInfo: TcxRowInfo)
  : TcxCustomGridRecordClass;
  begin
  Result := inherited GetRecordClass(ARecordInfo);
  if Result = TcxGridMasterDataRow then
  Result := TmycxGridMasterDataRow;
  end; }

{ TmycxGridGroupRow }

{ function TmycxGridMasterDataRow.GetExpandable: Boolean;
  begin
  Result := false;
  if Assigned((GridView as TmycxGridTableView).OnGetExpandable) then
  (GridView as TmycxGridTableView).OnGetExpandable(Self, Result) else Result
  := inherited GetExpandable;
  end; }

{ Tmf }

{ procedure Tmf.tvMainRecordExpandable(MasterDataRow: TcxGridMasterDataRow;
  var Expandable: Boolean);
  begin
  Expandable := MasterDataRow.RecordIndex > 0;
  end; }

{procedure Tmf.EXPANDROW(var Msg: TMessage);
var
  mr: TcxCustomGridRecord;
  gv: TcxGridTableView;
  cl: TcxCustomGridView;
begin
  if not((TObject(Msg.WParam) is TcxCustomGridRecord) and
    (TObject(Msg.LParam) is TcxGridTableView)) then
    Exit;
  mr := TcxCustomGridRecord(Msg.WParam);
  gv := TcxGridTableView(Msg.LParam);
  cl := gv.Clones[gv.CloneCount - 1];
  cl.BeginUpdate;
  try
    if mr.RecordIndex = 1 then

      with cl.DataController do
      begin
        cl.DataController.RecordCount := 2;
        cl.DataController.Values[0, 1] := 'album1url1';
        cl.DataController.Values[1, 1] := 'album1url2';
      end;
  finally
    cl.EndUpdate;
  end;
end;    }

procedure Tmf.NEWLIST(var Msg: TMessage);
var
  n: TMycxTabSheet;
  f: TfNewList;

begin
  n := CreateTab(pcTables);
  n.ImageIndex := 0;
  f := TfNewList.Create(n);
  f.SetLang;
  f.State := lfsNew;
  //f.Tag := integer(n);
  //n.Tag := integer(f);
  n.SecondFrame := f;

  f.LoadItems;

  f.Parent := n;
  pcTables.Change;
  ShowDs;
end;

procedure Tmf.OnError(Sender: TObject; Msg: String);
begin
  if mErrors.Lines.Count = 0 then
    mErrors.Lines[0] := FormatDateTime('hh:nn:ss',Time) + ' ' + Msg
  else
    mErrors.Lines.Add(FormatDateTime('hh:nn:ss',Time) + ' ' + Msg);
  dsLogs.AutoHide := false;
  dsLogs.Show;
  dsLogs.ActiveChild := dpErrors;
end;

procedure Tmf.OnTabClose(ASender: TObject; ATabSheet: TcxTabSheet);
begin
  CloseTab(ATabSheet);
end;

procedure Tmf.pcTablesChange(Sender: TObject);
begin
  if (pcTables.ActivePage <> nil) and (pcTables.ActivePage is TMycxtabSheet) then
  begin
    if (TMycxtabSheet(pcTables.ActivePage).SecondFrame is TfNewList) then
    begin
      pcTables.Options := pcTables.Options + [pcoCloseButton];
      bbStartList.Caption := _STARTLIST_ ;
      bbStartPics.Caption := _STARTPICS_;
      bbStartList.Enabled := false;
      bbStartPics.Enabled := false;
      dsTags.Hide;
    end
    else if (TMycxtabSheet(pcTables.ActivePage).MainFrame is TfGrid) then
    with (TMycxtabSheet(pcTables.ActivePage).MainFrame as TfGrid) do
    begin
      //dsTags.Show;
      if ResList.ListFinished then
      begin
        bbStartList.Caption := _STARTLIST_ ;
        bbStartPics.Enabled := true;
      end else
      begin
        bbStartList.Caption := _STOPLIST_;
        bbStartPics.Enabled := false;
      end;
      bbStartList.Enabled := true;
      //bbStartPics.Enabled := true;

      if ResList.PicsFinished then
      begin
        bbStartPics.Caption := _STARTPICS_ ;
        bbStartList.Enabled := true;
      end else
      begin
        bbStartPics.Caption := _STOPPICS_;
        bbStartList.Enabled := false;
      end;
      //bbStartList.Enabled := true;

      pcTables.Options := pcTables.Options + [pcoCloseButton];

      if not dsTags.AutoHide then
        dsTags.Show;

{      Screen.Cursor := crHourGlass;
      try
        vd.Open;
      finally
        Screen.Cursor := crDefault;
      end;  }
      UpdateFocusedRecord;
      ChangeResInfo;
      //sBar.Panels[1].Text := 'TTL ' + IntToStr(vGrid.DataController.RecordCount);
    end else
    begin
      //dsTags.Hide;
      bbStartList.Caption := _STARTLIST_ ;
      bbStartPics.Caption := _STARTPICS_;
      bbStartList.Enabled := false;
      bbStartPics.Enabled := false;
      pcTables.Options := pcTables.Options - [pcoCloseButton];
      dsTags.Hide;
    end;
  end;
end;

procedure Tmf.pcTablesPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
{  if (pcTables.ActivePage <> nil) and (pcTables.ActivePage is TMycxtabSheet) then
    if (TMycxtabSheet(pcTables.ActivePage).MainFrame is TfGrid) then
    with (TMycxtabSheet(pcTables.ActivePage).MainFrame as TfGrid) do
      vd.Close;   }

{  if (NewPage <> nil) and (NewPage is TMycxtabSheet) then
    if (TMycxtabSheet(NewPage).MainFrame is TfGrid) then
    with (TMycxtabSheet(NewPage).MainFrame as TfGrid) do
        vd.Open; }

end;

procedure Tmf.PicInfo(Sender: TObject; a: TTPicture);
var
  i: integer;
  //r: TcxEditorRow;
begin
  if Sender = nil then
    CurPic := nil
  else if ((pcTables.ActivePage as tMycxTabSheet).MainFrame <> Sender)
     or (CurPic = a) then
    Exit
  else
    CurPic := a;

  if CurPic = nil then
  begin
    vgCurMain.ClearRows;
    chlbTags.Clear;
    Exit;
  end;

  vgCurMain.BeginUpdate;
  try
    vgCurMain.ClearRows;
    dm.CreateField(vgCurMain,'vgiRName',_RESNAME_,'',ftReadOnly,nil,
      a.Resource.Name);
    dm.CreateField(vgCurMain,'vgiName',_FILENAME_,'',ftReadOnly,nil,
      a.PicName + '.' + a.Ext);
    dm.CreateField(vgCurMain,'vgiSavePath',_SAVEPATH_,'',ftReadOnly,nil,
      a.FileName);
    for i := 0 to a.Meta.Count -1 do
      with a.Meta.Items[i] do
        dm.CreateField(vgCurMain,'avgi' + Name,Name,
          '',ftReadOnly,nil,VarToStr(Value));
  finally
    vgCurMain.EndUpdate;
  end;

  chlbTags.Items.BeginUpdate;
  try
  chlbTags.Clear;

  for i := 0 to a.Tags.Count-1 do
    chlbTags.AddItem(a.Tags[i].Name + ' (' + IntTOStr(a.Tags[i].Linked.Count) + ')');

  finally
    chlbTags.Items.EndUpdate;
  end;
end;

procedure Tmf.RefreshResInfo(Sender: TObject);
var
  i: integer;
begin
  vgTagsMain.BeginUpdate;
  try
    //vgTagsMain.ClearRows;
    if (pcTables.ActivePage is TMycxTabSheet)
    and ((pcTables.ActivePage as TMycxTabSheet).MainFrame is tfGrid) then
    with ((pcTables.ActivePage as TMycxTabSheet).MainFrame as tfGrid) do
      //for i := 0 to ResList.Count -1 do
      if (Sender is TResource) then
      begin
        i := ResList.IndexOf(Sender);
        if i = -1 then
          Exit;
        (vgTagsMain.RowByName('vgT' + IntToStr(i)) as  TcxEditorRow)
        .Properties.Value :=
          ifn(ResList.ListFinished,
          ifn(ResList.PicsFinished,'',   //if pics
          IntToStr(ResList[i].PictureList.PicCounter.FSH + ResList[i].PictureList.PicCounter.SKP)
          + '/' + IntToStr(ResList[i].PictureList.Count)
          + ifn(ResList[i].PictureList.PicCounter.ERR > 0,
          ' err ' + IntToStr(ResList[i].PictureList.PicCounter.ERR),'')),

          IntToStr(ResList[i].JobList.OkCount) + '/'    //if pages
          + IntToStr(ResList[i].JobList.Count)
          + ' (' + IntToStr(ResList[i].HTTPRec.Theor) + ')'
          + ifn(ResList[i].JobList.ErrorCount > 0,
          ' err ' + IntToStr(ResList[i].JobList.ErrorCount),''));
      end;
  finally
    vgTagsMain.EndUpdate;
  end;
end;

procedure Tmf.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  OnError(Sender,E.Message);
end;

procedure Tmf.APPLYNEWLIST(var Msg: TMessage);
var
  n: TMycxTabSheet;
  f: TfNewList;
  f2: TfGrid;
  i: integer;

begin
  n := TMycxTabSheet(Msg.WParam);

  f := n.SecondFrame as tfNewList; //TfNewList(n.Tag);
  f2 := TfGrid.Create(n) as tfGrid;
  f2.SetLang;
  f2.CreateList;
  f2.ResList.OnError := OnError;

  f.ResetItems;

  if VarToStr(FullResList[0].Fields['tag']) <> '' then
    n.Caption := FullResList[0].Fields['tag'];

  f2.ResList.OnPageComplete := RefreshResInfo;

  with f.tvRes.DataController do
    for i := 0 to RecordCount - 1 do
      if Values[i, 0] <> 0 then
        f2.ResList.CopyResource(FullResList[Values[i, 0]]);

  FreeAndNil(n.SecondFrame);
  f2.Reset;
  n.MainFrame := f2;
  f2.Parent := n;
  f2.ResList.ThreadHandler.Cookies := FCookie;
  f2.ResList.DWNLDHandler.Cookies := FCookie;
  f2.OnPicChanged := PicInfo;
  f2.SetSettings;

  f2.ResList.StartJob(JOB_LIST);
  //f2.vd.Open;
  ShowPanels;
end;

procedure Tmf.APPLYSETTINGS(var Msg: TMessage);
var
  // n: TdxDockPanel;
  f: TfSettings;
begin
  f := SttPanel.MainFrame as tfSettings;

  SaveProfileSettings;
  f.OnClose;
  CloseTab(SttPanel as TcxTabSheet);
  // SttPanel := nil;
end;

procedure Tmf.bbNewClick(Sender: TObject);
begin
  PostMessage(Handle,CM_NEWLIST,0,0);
end;

procedure Tmf.bbSettingsClick(Sender: TObject);
begin
  PostMessage(Handle,CM_SHOWSETTINGS,0,0);
end;

procedure Tmf.bbStartListClick(Sender: TObject);
var
  f: TFrame;

begin
  f := TFrame((pcTables.ActivePage as TMycxTabSheet).MainFrame);
  if f is TfGrid then
    with (f as TfGrid) do
    begin
      vGrid.DataController.Post;
      if ResList.ListFinished then
      begin
        SetSettings;
        ResList.StartJob(JOB_LIST);
      end else
        ResList.StartJob(JOB_STOPLIST);
    end;
end;

procedure Tmf.bbStartPicsClick(Sender: TObject);
var
  f: TFrame;

begin
  f := TFrame((pcTables.ActivePage as TMycxTabSheet).MainFrame);
  if f is TfGrid then
    with (f as TfGrid) do
    begin
      //vGrid.DataController.Post;
      if ResList.PicsFinished then
      begin
        SetSettings;
        ResList.StartJob(JOB_PICS)
      end else
        ResList.StartJob(JOB_STOPPICS);
    end;
end;

procedure Tmf.CANCELNEWLIST(var Msg: TMessage);
var
  n: TMycxTabSheet;
  //f: TfNewList;

begin
  n := Pointer(Msg.WParam);
//  FreeAndNil(n.SecondFrame);
  CloseTab(n);
end;

procedure Tmf.CANCELSETTINGS(var Msg: TMessage);
var
  f: TfSettings;

begin
  // n := Pointer(Msg.WParam);
  f := SttPanel.MainFrame as TfSettings;
  f.OnClose;
//  f.Free;
  CloseTab(SttPanel);
end;

procedure Tmf.ChangeResInfo;
var
  i: integer;
begin
  vgTagsMain.BeginUpdate;
  try
    vgTagsMain.ClearRows;
    if (pcTables.ActivePage is TMycxTabSheet)
    and ((pcTables.ActivePage as TMycxTabSheet).MainFrame is tfGrid) then
    with ((pcTables.ActivePage as TMycxTabSheet).MainFrame as tfGrid) do
      for i := 0 to ResList.Count -1 do
      begin
        if ResList[i].JobList.ErrorCount = 0 then
          dm.CreateField(vgTagsMain,'vgT' + IntToStr(i),ResList[i].Name,
          '',ftReadOnly,nil,
            ifn(ResList.ListFinished,
            ifn(ResList.PicsFinished,'',   //if pics
            IntToStr(ResList[i].PictureList.PicCounter.FSH + ResList[i].PictureList.PicCounter.SKP)
            + '/' + IntToStr(ResList[i].PictureList.Count)
            + ifn(ResList[i].PictureList.PicCounter.ERR > 0,
            ' err ' + IntToStr(ResList[i].PictureList.PicCounter.ERR),'')),

            IntToStr(ResList[i].JobList.OkCount) + '/'    //if pages
            + IntToStr(ResList[i].JobList.Count)
            + ' (' + IntToStr(ResList[i].HTTPRec.Theor) + ')'
            + ifn(ResList[i].JobList.ErrorCount > 0,
            ' err ' + IntToStr(ResList[i].JobList.ErrorCount),'')));
      end;
  finally
    vgTagsMain.EndUpdate;
  end;
end;

procedure Tmf.CheckUpdates;
var
  t: TUPDThread;
begin
  t := TUPDThread.Create;
  t.Job := UPD_CHECK_UPDATES;
  t.MsgHWND := Self.Handle;
  t.FreeOnTerminate := true;
  t.ListURL := GlobalSettings.UPDServ;
  lupd.Show;
  lupd.BringToFront;
  SetEvent(t.Event);
end;

procedure Tmf.ENDJOB(var Msg: TMessage);
{var
  t: TMycxTabSheet; }
begin
  pcTables.Change;
{  t := TMycxTabSheet(Msg.WParam);
  t.SetIcon(0); }
end;

procedure Tmf.UPDATECHECK(var Msg: TMessage);
begin
  lupd.Hide;
  case MSG.WParam of
//    0: ShowUPDHint(_UPDATING_,_UPDATEERROR_);
    1: {ShowUPDHint(_UPDATING_,_NEWUPDATES_);}
      if MessageDLG(_NEWUPDATES_,mtConfirmation,[mbYes,mbNo],0) = mrYes then
        StartUpdate;
//    2: ShowUPDHint(_UPDATING_,_NOUPDATES_);
  end;
  ;
end;

procedure Tmf.STARTJOB(var Msg: TMessage);
{var
  t: TMycxTabSheet;  }
begin
  pcTables.Change;
{  t := TMycxTabSheet(Msg.WParam);
  t.SetIcon(0,15,true); }
end;

procedure Tmf.LANGUAGECHANGED(var Msg: TMessage);
var
  i: integer;
begin
  LoadLang(IncludeTrailingPathDelimiter(ExtractFilePath(paramstr(0))
  + 'languages') + langname+'.ini');

  SetLang;
  for i := 0 to pcTables.PageCount-1 do
    if pcTables.Pages[i] is tMycxTabSheet then
      with (pcTables.Pages[i] as tMycxTabSheet) do
      begin
        if Assigned(MainFrame) then
          if MainFrame is tfGrid then
            (MainFrame as tfGrid).SetLang
          else if MainFrame is tfNewList then
            (MainFrame as tfNewList).SetLang
          else if MainFrame is tfSettings then
            (MainFrame as tfSettings).SetLang;
        if Assigned(SecondFrame) then
          if SecondFrame is tfNewList then
            (SecondFrame as tfNewList).SetLang;
      end;


end;

procedure Tmf.StartUpdate;
var
  f: tfileStream;
  r: tresourcestream;
begin
  f := tfilestream.Create(IncludeTrailingPathDelimiter(rootdir)
    + 'NPUpdater.exe',fmCreate);
  try
    r := tresourcestream.Create(hInstance,'ZUPDATER','UPDTER');
    try
      r.SaveToStream(f);
    finally
      r.Free;
    end;
  finally
    f.Free;
  end;

  ShellExecute(Handle, 'open',PWidechar(IncludeTrailingPathDelimiter(rootdir)
    + 'NPUpdater.exe'), nil, nil, SW_SHOWNORMAL);
  Close;
end;

procedure Tmf.testoClick(Sender: TObject);
begin
  fmAbout.Show;
end;

procedure Tmf.CloseTab(t: TcxTabSheet);
var
  f: TFrame;
begin
  // pcTables.Tabs
  if t is TMycxTabSheet then
  begin
    f := (t as tMycxTabSheet).MainFrame;
    if f is TfGrid then
    with (f as TfGrid) do
      if not ResList.ListFinished
      or not ResList.PicsFinished then
      begin
        MessageDlg(_TAB_IS_BUSY_,mtError,[mbOk],0);
        Exit;
      end else
        Relise;
{    f := (t as tMycxTabSheet).MainFrame;
    if f is TfNewList then
    begin
      PostMessage(Handle, CM_CANCELNEWLIST, Integer(t), 0)
    end;      }
    FreeAndNil(f);
  end;

  t.Free;
  pcTables.Change;
  // FreeAndNil(t);
  TabList.Remove(t);
  if SttPanel = t then
    SttPanel := nil;
  if pcTables.TabCount = 0 then
    HideDs;
end;

function Tmf.CreateTab(pc: TcxPageControl; Enc: boolean): TMycxTabSheet;
var
  n: TMycxTabSheet;

begin
  if Assigned(mFrame) then
    FreeAndNil(mFrame);

  n := TMycxTabSheet.Create(Self);
  //n.ImageIndex := 0;
  n.Caption := _NEWTABCAPTION_ + IntToStr(TabList.Count + 1);
  // n.OnClose := dxTabClose;
  // n.Dockable := false;
  // n.ShowCaption := false;
  // n.CaptionButtons := [cbClose];
  n.PageControl := pc;
  pc.ActivePage := n;
  { if pc.PageCount < 2 then
    pc.HideTabs := true; }

  if Enc then
  begin
//    pc.Change;
    TabList.Add(n);
  end;
  Result := n;

  ShowDs;
end;

procedure Tmf.dxTabClose(Sender: TdxCustomDockControl);
begin
  PostMessage(Application.MainForm.Handle, CM_CLOSETAB, integer(Sender), 0);
end;

procedure Tmf.Setlang;
begin
  Caption := FoldCaption + ' ' + VINFO.FileVersion + 'α';
  bbNew.Caption := _NEWLIST_;
  bbStartList.Caption := _STARTLIST_;
  bbStartPics.Caption := _STARTPICS_;
  bbSettings.Caption := _SETTINGS_;
  dpLog.Caption := _LOG_;
  dpErrors.Caption := _ERRORS_;
  dpTags.Caption := _COMMON_;
  dpCurTags.Caption := _INFO_;
  nbgCurMain.Caption := _GENERAL_;
  nbgTagsMain.Caption := _GENERAL_;
  nbgCurTags.Caption := _TAGS_;
  nbgTagsTags.Caption := _TAGS_;
end;

procedure Tmf.ShowDs;
begin
  pcTables.Change;
  if not ds.Visible then
  begin
    // bmbMain.Visible := true;
    ds.Show;
  end;
end;

procedure Tmf.ShowUPDHint(title, description: string);
begin
//  lupd.Hint := 'Derp';

  balloonhint.Description := description;
  balloonhint.Title := title;
  balloonhint.ShowHint(ClientToScreen(Point(mf.ClientWidth - 5,5)));
end;

procedure Tmf.ShowPanels;
begin
  if not bmbMain.Visible then
    bmbMain.Visible := true;
  pcTables.Change;
  PicInfo(nil,nil);
  if not dsLogs.AutoHide then
    dsLogs.Visible := true;
end;

procedure Tmf.SHOWSETTINGS(var Msg: TMessage);
var
  // n: TdxDockPanel;
  f: TfSettings;

begin
  if Assigned(SttPanel) then
  begin
    pcTables.ActivePage := SttPanel;
    Exit;
  end;

  if pcTables.PageCount = 0 then
  begin
    pcTables.HideTabs :=  true;
    dpLog.Visible := false;
    dpErrors.Visible := false;
  end;


  SttPanel := CreateTab(pcTables, false);
  SttPanel.ImageIndex := 1;
  SttPanel.Caption := _SETTINGS_;

  f := TfSettings.Create(SttPanel);
  f.SetLang;
  f.LoadSettings;
{  f.GetLanguages;

  with f, GlobalSettings do
  begin
    chbProxy.Checked := Proxy.UseProxy;
    eHost.Text := Proxy.Host;
    ePort.Value := Proxy.Port;
    chbProxyAuth.Checked := Proxy.Auth;
    eProxyLogin.Text := Proxy.Login;
    eProxyPassword.Text := Proxy.Password;
    chbProxySavePWD.Checked := Proxy.SavePWD;

    eThreads.Value := Downl.ThreadCount;
    eRetries.Value := Downl.Retries;
    //chbDebug.Checked := Downl.Debug;

    chbUseThreadPerRes.Checked := Downl.UsePerRes;
    eThreadPerRes.EditValue := Downl.PerResThreads;
    ePicThreads.EditValue := Downl.PicThreads;

  end;                }

  //f.Tag := integer(SttPanel);
  SttPanel.MainFrame := f;
  //SttPanel.Tag := integer(f);
  f.ResetButons;
  f.Parent := SttPanel;
  ShowDs;
end;

procedure Tmf.FormCreate(Sender: TObject);
begin
  FOldCaption := Caption;
  SetLang;
  pcTables.OnPageClose := OnTabClose;
  FullResList.OnError := OnError;
  dsFirstShow := true;
  SttPanel := nil;
  FCookie := TMyCookieList.Create;

  mFrame := TfStart.Create(Self);
  (mFrame as TfStart).SetLang;
  mFrame.Parent := Self;

  TabList := TList.Create;
  bmbMain.Visible := false;

  dsLogs.AutoHide := true;
  dsLogs.Hide;
  dsTags.Hide;
  CurPic := nil;
  CheckUpdates;
end;

procedure Tmf.FormDestroy(Sender: TObject);
begin
  if Assigned(mFrame) then
    mFrame.Free;
  if Assigned(SttPanel) then
    SttPanel.Free;
  TabList.Free;
  FCookie.Free;
end;

procedure Tmf.gLevel2GetGridView(Sender: TcxGridLevel;
  AMasterRecord: TcxCustomGridRecord; var AGridView: TcxCustomGridView);

begin
  PostMessage(Handle, CM_EXPROW, integer(AMasterRecord), integer(AGridView));
end;

procedure Tmf.HideDs;
begin
  if ds.Visible then
  begin
    ds.Hide;
    dsTags.Hide;
    dsLogs.Hide;
    bmbMain.Visible := false;
    pcTables.HideTabs := false;
    dpLog.Visible := true;
    dpErrors.Visible := true;
    mFrame := TfStart.Create(Self);
    (mFrame as TfStart).SetLang;
    mFrame.Parent := Self;
  end;
end;

end.
