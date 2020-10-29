/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CreatedBy]
      ,[UpdatedBy]
      ,[CreateDate]
      ,[RecordDate]
      ,[RowPointer]
      ,[NoteExistsFlag]
      ,[InWorkflow]
      ,[po_num]
      ,[po_line]
      ,[po_release]
      ,[seq]
      ,[item]
      ,[vendlot]
      ,[qty_shipped]
  FROM [TEST_TEVFTMAIN_App].[dbo].[TEVTB_itemvendlot]
  WHERE [po_num] = 'TU.LOG.SE'
  --AND [po_line] = 1 AND [po_release] = 1
  ORDER BY [seq]
  -- AND [seq] = 51

  --GO

  --DELETE
  --FROM [TEST_TEVFTMAIN_App].[dbo].[TEVTB_itemvendlot]
  --WHERE [po_num] = 'TU.LOG.SE'

  --111277811|162710f8fe22|CAP, CERAMIC 0.022MF X7R 1005|TUN|TUN-RM-H10-0015|5000|1301-O2	
  --X25861611|            |HEAT SINK ASSY|TUN|TUN-RM-H03-0015|560.00000000|1405-O3	

  --N111671511	
  --111277811|164040f0d2a6|CAP, CERAMIC 0.022MF X7R 1005|TUN|TUN-RM-H10-0015|8000.000000|1301-O2	