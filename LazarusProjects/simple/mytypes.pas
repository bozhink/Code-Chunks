unit MyTypes;

{$mode objfpc}{$H+}

interface

type
  TSName = String[30];   // Short name
  TLName = String[255];  // Long name
  TSYear = String[4];
  TMyObject = Record
    Title       : TLName;
    Director    : TLName;
    Producer    : TLName;
    Cast        : TLName;
    Country     : TSName;
    Gender      : TSName;
    Year        : TSYear;
    Description : TLName;
    Comments    : TLName;
    Languages   : TLName;
    Subtitles   : TLName;
    Duration    : TSName;
    end;
  TXMyObject = Record
    ID : Integer;
    Content : TMyObject;
    end;
  TFXMyObject = File of TXMyObject;
  TFName = String[64];
  
  function eqTitle(S1, S2 : TMyObject) : Boolean;
  function eqDirector(S1, S2 : TMyObject) : Boolean;
  function eqProducer(S1, S2 : TMyObject) : Boolean;
  function eqCast(S1, S2 : TMyObject) : Boolean;
  function eqCountry(S1, S2 : TMyObject) : Boolean;
  function eqGender(S1, S2 : TMyObject) : Boolean;
  function eqYear(S1, S2 : TMyObject) : Boolean;
  function eqDescription(S1, S2 : TMyObject) : Boolean;
  function eqComments(S1, S2 : TMyObject) : Boolean;
  function eqLanguages(S1, S2 : TMyObject) : Boolean;
  function eqSubtitles(S1, S2 : TMyObject) : Boolean;
  function eqDuration(S1, S2 : TMyObject) : Boolean;
  function eqFull(S1, S2 : TMyObject) : Boolean;
  
  procedure mov(const movIn : TMyObject; var movOut : TMyObject);
  
  function CreateMyObject(xTitle       : TLName;
                          xDirector    : TLName;
                          xProducer    : TLName;
                          xCast        : TLName;
                          xCountry     : TSName;
                          xGender      : TSName;
                          xYear        : TSYear;
                          xDescription : TLName;
                          xComments    : TLName;
                          xLanguages   : TLName;
                          xSubtitles   : TLName;
                          xDuration    : TSName) : TMyObject;

implementation
  
  function eqTitle(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Title = S2.Title) then
      eqTitle := True
    else
      eqTitle := False;
  end;
  
  function eqDirector(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Director = S2.Director) then
      eqDirector := True
    else
      eqDirector := False;
  end;
  
  function eqProducer(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Producer = S2.Producer) then
      eqProducer := True
    else
      eqProducer := False;
  end;
  
  function eqCast(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Cast = S2.Cast) then
      eqCast := True
    else
      eqCast := False;
  end;
  
  function eqCountry(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Country = S2.Country) then
      eqCountry := True
    else
      eqCountry := False;
  end;
  
  function eqGender(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Gender = S2.Gender) then
      eqGender := True
    else
      eqGender := False;
  end;
  
  function eqYear(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Year = S2.Year) then
      eqYear := True
    else
      eqYear := False;
  end;
  
  function eqDescription(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Description = S2.Description) then
      eqDescription := True
    else
      eqDescription := False;
  end;
  
  function eqComments(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Comments = S2.Comments) then
      eqComments := True
    else
      eqComments := False;
  end;
  
  function eqLanguages(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Languages = S2.Languages) then
      eqLanguages := True
    else
      eqLanguages := False;
  end;
  
  function eqSubtitles(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Subtitles = S2.Subtitles) then
      eqSubtitles := True
    else
      eqSubtitles := False;
  end;
  
  function eqDuration(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Duration = S2.Duration) then
      eqDuration := True
    else
      eqDuration := False;
  end;
  
  function eqFull(S1, S2 : TMyObject) : Boolean;
  begin
    eqFull := eqTitle(S1, S2) and eqDirector(S1, S2) and eqProducer(S1, S2) and
              eqCast(S1, S2) and eqCountry(S1, S2) and eqGender(S1, S2) and
              eqYear(S1, S2) and eqDescription(S1, S2) and
              eqComments(S1, S2) and eqLanguages(S1, S2) and
              eqSubtitles(S1, S2) and eqDuration(S1, S2);
  end;
  
  procedure mov(const movIn : TMyObject; var movOut : TMyObject);
  begin
    movOut.Title       := movIn.Title;
    movOut.Director    := movIn.Director;
    movOut.Producer    := movIn.Producer;
    movOut.Cast        := movIn.Cast;
    movOut.Country     := movIn.Country;
    movOut.Gender      := movIn.Gender;
    movOut.Year        := movIn.Year;
    movOut.Description := movIn.Description;
    movOut.Comments    := movIn.Comments;
    movOut.Languages   := movIn.Languages;
    movOut.Subtitles   := movIn.Subtitles;
    movOut.Duration    := movIn.Duration;
  end;
  
  function CreateMyObject(xTitle       : TLName;
                          xDirector    : TLName;
                          xProducer    : TLName;
                          xCast        : TLName;
                          xCountry     : TSName;
                          xGender      : TSName;
                          xYear        : TSYear;
                          xDescription : TLName;
                          xComments    : TLName;
                          xLanguages   : TLName;
                          xSubtitles   : TLName;
                          xDuration    : TSName) : TMyObject;
  begin
    With CreateMyObject do begin
      Title       := xTitle;
      Director    := xDirector;
      Producer    := xProducer;
      Cast        := xCast;
      Country     := xCountry;
      Gender      := xGender;
      Year        := xYear;
      Description := xDescription;
      Comments    := xComments;
      Languages   := xLanguages;
      Subtitles   := xSubtitles;
      Duration    := xDuration;
    end;
  end;

end.

