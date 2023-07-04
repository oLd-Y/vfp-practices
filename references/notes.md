# Common Grid's attributes

1. ActiveCell
2. AfterRowColChange Event
3. AllowAddNew
4. AllowCellSelection
5. AllowHeaderSizing
6. AllowRowSizing
7. BackColor
8. ColumnCount
9. DeleteMark
10. DoScroll
11. Enabled
12. FontBold
13. FontItalic
14. FontName
15. FontSize
16. ForeColor
17. GridLineColor
18. GridLineWidth
19. GridLines
20. HeaderHeight
21. Height
22. HighlightStyle
23. Highlight 所有
24. Left
25. LockColumns
26. Name
27. ReadOnly
28. RecordMark
29. RecordSource
30. RecordSourceType
31. Refresh
32. RowHeight
33. ScrollBars
34. SplitBar
35. Width
36. setFocus

# multiple methods of loop

DO WHILE !EOF()

	SKIP
ENDDO


SCAN REST WHILE ivt_quan >=3000

ENDSCAN

LOCATE FOR ivt_quan <= 4000
DO WHILE !EOF()

	CONTINUE
ENDDO

CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
INDEX ON ivt_quan TAG ivt_quan
SET ORDER TO ivt_quan DESCENDING

APPEND FROM Inventory.dbf FOR ivt_quan  <= 4000