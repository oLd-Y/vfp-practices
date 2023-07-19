clos data
use cust in 1 excl
use card in 2 excl
zap in card
select cust
scan
	select card
	append blank
	replace next 1 card_id with recno(),;
					cust_code with cust.khdm,;
					cust_no with cust.sfzh,;
					cust_name with cust.khmc,;
					cust_short with cust.khjc,;
					cust_phone with cust.lxdh,;
					create_at with datetime(),;
					remark with ttoc(datetime() ) + "   导入"
	
	
	select cust
endscan
clos data

return


clos data

use cust in 1 excl
use cust2 in 2 order tag khdm excl
zap in 1
select 2
scan
	select 1
	append blank
	replace next 1 khid with recno(),;
					khdm with cust2.khdm,;
					sfzh with cust2.sfzh,;
					khmc with cust2.khmc,;
					khjc with cust2.khjc,;
					lxdh with cust2.lxdh
	select 2
endscan
clos data



return

clos data

create table [htdc] (xwbh varchar(240),;
					 xwmc varchar(240),;
					 khmc varchar(240),;
					 htbh varchar(240),;
					 qsrq date,;
					 zzrq date,;
					 qdrq date,;
					 rqsj date,;
					 fydm varchar(240),;
					 fymc varchar(240),;
					 fylx varchar(240),;
					 fydj number(15, 3),;
					 fyje integer,;
					 lzzt varchar(240),;
					 htzt varchar(240) )
use


select 1
use [\\192.168.8.12\ipdc\zl\xwht.hb] again order tag xwbh shar

select 2
use [\\192.168.8.12\ipdc\zl\xwgl.hb] again order tag xwbh shar

select 3
use [\\192.168.8.12\ipdc\zl\area.hb] again order tag key shar

select 4
use [\\192.168.8.12\ipdc\zl\fylx.hb] again shar

select 5
use [\\192.168.8.12\ipdc\zl\xwht.hb] again order tag xwbh alias tzht shar
set filter to "退租" $ ghhtzt

select 6
use [\\192.168.8.12\ipdc\jyvip\vip_ps] again order tag cred_num shar

select 7
use [\\192.168.8.12\ipdc\jyvip\vip_ep] again order tag xydm shar

select 8
use htyz order tag xwbh

select 9
use htdc

lnCount = 0
lcStr = ""
lcRepeat = ""

select 1
scan for xwbh # "00000-2362"
*		if seek(xwbh, "tzht")
*			if qdrq < tzht.qdrq
*				loop
*			endif
*		endif
	if yjje <= 0
		loop
	endif
	lnCount = lnCount + 1
	lcStr = lcStr + xwbh + chr(13)
	
	=seek(left(xwbh, 5), "area")
	=seek(xwbh, "xwgl")
	=seek(khbh, "vip_ps")
	=seek(khbh, "vip_ep")
	
	select htdc
	append blank
	replace next 1	xwbh with xwht.xwbh,;
					xwmc with alltrim(area.bm) + alltrim(area.qy) + alltrim(area.td) + alltrim(area.lc) + "-" + alltrim(xwgl.xwmc),;
					khmc with alltrim(vip_ps.name) + alltrim(vip_ep.khmc),;
					htbh with xwht.hth,;
					qsrq with xwht.qsrq,;
					zzrq with xwht.zzrq,;
					qdrq with xwht.qdrq,;
					rqsj with xwht.rqsj,;
					fydm with "0",;
					fymc with "租金",;
					fylx with "日",;
					fydj with xwht.dj,;
					fyje with xwht.jbfy,;
					lzzt with xwht.lzzt,;
					htzt with xwht.ghhtzt
					
	for i = 1 to (len(alltrim(xwht.fwf) ) / 8)
		lx = substr(xwht.fwf, (i - 1) * 8 + 1, 1)
		je = substr(xwht.fwf, (i - 1) * 8 + 2, 7)
		je = val(je)
		select fylx
		locate for key = lx
		if !found()
			loop
		endif
		
		select htdc
		append blank
		temp = year(xwht.zzrq) - year(xwht.qsrq)
		temp = temp * 24 + month(xwht.zzrq) - month(xwht.qsrq) + 1
		replace next 1	xwbh with xwht.xwbh,;
						xwmc with alltrim(area.bm) + alltrim(area.qy) + alltrim(area.td) + alltrim(area.lc) + "-" + alltrim(xwgl.xwmc),;
						khmc with alltrim(vip_ps.name) + alltrim(vip_ep.khmc),;
						htbh with xwht.hth,;
						qsrq with xwht.qsrq,;
						zzrq with xwht.zzrq,;
						qdrq with xwht.qdrq,;
						rqsj with xwht.rqsj,;
						fydm with lx,;
						fymc with alltrim(fylx.fymc),;
						fylx with fylx.jffs,;
						fydj with iif(fylx.jffs = "月", je / temp, je),;
						fyje with je * iif(lx $ "OPQ", -1, 1),;
						lzzt with xwht.lzzt,;
						htzt with xwht.ghhtzt
	endfor
					
	select 1
endscan

clos data

wait lnCount wind
strtofile(lcRepeat, "d:\233.txt")

return

clos data
select 1
use customer again share

select 2
use \\192.168.7.12\ipdc\jyvip\vip_ps again shar
scan
	select 1
	append blank
	replace next 1	cust_no with vip_ps.cred_num,;
					cust_name with vip_ps.name,;
					cust_addr with vip_ps.addressc,;
					cust_phone with vip_ps.phone
	
	select 2
endscan

use \\192.168.7.12\ipdc\jyvip\vip_ep again shar
scan
	select 1
	append blank
	replace next 1	cust_no with vip_ep.xydm,;
					cust_name with vip_ep.khmc,;
					cust_addr with vip_ep.jydz,;
					cust_phone with ""
	
	select 2
endscan

clos data