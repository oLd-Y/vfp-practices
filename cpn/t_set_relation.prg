*begin sample
&&create the parent table
create cursor tparent (pk I,cText C(20))
&&it has a primary key to indentify each row

&& insert some test values into parent
 insert into tparent values (1,"One")
 insert into tparent values (2,"Two")
 insert into tparent values (3,"Three")

&&create the child table
 create cursor tchild (fk I, cText C(20))
&&it has a foreign key to store the related
&&parent record

&& insert some values
 insert into tchild values (1,"Related to One")
 insert into tchild values (1,"Another One")
 insert into tchild values (1,"Third One")
 insert into tchild values (2,"The only 2nd")

*we need an index for the child table
select tchild
index on fk tag ForeignKey
 * show, but don't stop the procedure
 browse name oChild nowait
 * adjust pos and size
 with oChild
  .Top = 200
  .Left = 200
  .Width = 400
  .Height = 200
 endwith

* set the relation
* the parent table must be in scope
 select tparent
* the TO expression is the parent key
 set relation to pk into tchild
* the target of the relation is the child

 go top
 browse name oParent nowait
 with oParent
  .Width = 400
  .Height = 200
 endwith
*end sample