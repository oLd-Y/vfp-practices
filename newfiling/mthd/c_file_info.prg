lcDbPath = AddBS(JustPath(_VFP.ActiveProject.Name)) + "db\"
Create Table (lcDbPath) + "file_info" (;
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
Index On pass_num Tag pass_num
Use In file_info
Use file_info In 8 Alias file_info Order pass_num Exclusive