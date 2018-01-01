CREATE FULLTEXT INDEX
    ON [dbo].[Notes]
        (Content)
    KEY INDEX [IDX_Notes_Content]
    ON [FTC_Notes]
    WITH CHANGE_TRACKING AUTO
