CREATE TABLE Inventory ;
  (ivt_type C(4), ;
   ivt_name C(8), ;
   ivt_quan N(8,2), ;
   ivt_date D)

INDEX ON ivt_quan TAG ivt_quan DESC