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

# some useful grammer

1. 交替显示白色和绿色记录
    ```visual foxpro
    frmInventory.grdGrid1.SetAll("DynamicBackColor", ;
    "IIF(MOD(RECNO( ), 2)=0, RGB(255,255,255) ;
    , RGB(0,255,0))", "Column")  
    ```

2. 启动事务
    ```visual foxpro
    frmInventory.SHOW  && 显示该表单
    READ EVENTS  && 启动事件处理
    ```
# 恒等运算符
“张三丰” = “张三” && .T.
“张三” = “张三丰” && .F. 

“张三丰” == “张三” && .F.
“张三” == “张三丰” && .F.

# calculate scale
```visual forpro
select tb_score_distr
go top
SCAN
SELECT t_score
count for t_score.all_score <= tb_score_distr.all_score .AND. t_score.all_score > (tb_score_distr.all_score - 10) to m.stu_count
m.scale = str((m.stu_count / recc()) * 100, 10, 5) + "%"

    select tb_score_distr
    replace ;
        scale with m.scale, ;
        stu_count with m.stu_count
ENDSCAN

```

# 使用scan创建各表。（grade表单）
```visual foxpro
&& The ranking is based on the all_score from the highest to the lowest,
&& and the same all_score will be ranked according to the value of
&& mathematics, english and composite score from the highest to the lowest.
create table m.pub_path + "t_score" ( ;
    pass_num C(8), ;
    id_card C(18), ;
    stu_name C(8), ;
    high_name C(30), ;
    all_score N(3), ;
    chinese N(3), ;
    math N(3), ;
    english N(3), ;
    composite N(3), ;
    rank N(6), ;
    volu_name1 C(30), ;
    volu_name2 C(30), ;
    volu_name3 C(30) ;
)

use in t_score
use m.pub_path + "t_score" excl in 5

select t_score
index on rank tag rank

select score
go top
SCAN
    select student
    set order to pass_num
    seek score.pass_num

    select highschool
    seek student.high_code

    select university
    seek student.volu_code1
    m.volu_name1 = univ_name

    m.volu_name2 = univ_name
    seek student.volu_code3
    m.volu_name3 = univ_name

    select t_score
    APPEND BLANK
    REPLACE rank WITH recn(), ;
            pass_num WITH student.pass_num, ;
            id_card WITH student.id_card, ;
            stu_name WITH student.stu_name, ;
            high_name WITH highschool.high_name, ;
            all_score WITH score.all_score, ;
            chinese WITH score.chinese, ;
            math WITH score.math, ;
            english WITH score.english, ;
            composite WITH score.composite, ;
            volu_name1 WITH m.volu_name1, ;
            volu_name2 WITH m.volu_name2, ;
            volu_name3 WITH m.volu_name3
ENDSCAN

select t_score
go top
```

# set filter to 
以下代码，score和highschool并不是只根据student当前指针所在的位置那条记录进行过滤
也就是说，对于多张表，set filter to 会遍历所有记录将不符合条件的记录筛掉，然后回到原来的指针位置

```visual foxpro
select student
set filter to volu_code1 = university.univ_code ;

set filter to pass_num = student.pass_num in score
set filter to high_code = student.high_code in highschool
```