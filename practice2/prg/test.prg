select B
go top
select A
go top

?"before scan:" + STR(RECN())
scan FOR recn() < 10
	?"recn A:" + STR(RECN())
	SELECT B
	?"recn B:" + STR(RECN())
	SKIP
endscan
?"after scan:" + STR(RECN())

