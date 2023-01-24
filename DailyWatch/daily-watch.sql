use dailywatch;
select * from daily_transaction where company_name = 'POLICYBZR';
select count(*) from daily_transaction;
UPDATE daily_transaction SET date_of_transaction = '2022-11-12' where date_of_transaction = '2022-11-13';
UPDATE daily_transaction SET daily_close = daily_close - 2 ;
UPDATE daily_transaction SET daily_close =  400 where company_name = 'POLICYBZR' and  date_of_transaction = '2022-11-11';
##SET SQL_SAFE_UPDATES = 0; POLICYBZR	A	399	401	373	2022-11-13
commit;
delete from daily_transaction;

SELECT * FROM daily_transaction WHERE date_of_transaction = curdate() -2;
select * from daily_transaction where (company_name in (SELECT company_name FROM daily_transaction WHERE date_of_transaction = curdate() -2));
SELECT DATE_ADD(`date_of_transaction`, INTERVAL -1 DAY) from daily_transaction where company_name = 'POLICYBZR';

UPDATE daily_transaction SET date_of_transaction = '2022-11-12';

SELECT DATE_ADD(`date_of_transaction`, INTERVAL -1 DAY) from daily_transaction where company_name = 'POLICYBZR';

UPDATE daily_transaction SET date_of_transaction = (SELECT DATE_ADD(`date_of_transaction`, INTERVAL -1 DAY) from daily_transaction where company_name = 'POLICYBZR');


select p1.company_name, p1.daily_close
from  (select * from daily_transaction where daily_transaction.date_of_transaction = curdate() -2) p1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 3)) p2
WHERE (p1.company_name = p2.company_name and p1.daily_close < p2.daily_close) ;


select p1.company_name, p1.daily_close
from  (select * from daily_transaction where daily_transaction.date_of_transaction = curdate()) p1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 1)) p2
WHERE (p1.company_name = p2.company_name and p1.daily_close > p2.daily_close);


select k1.company_name, k1.daily_close
from  (select p1.company_name, p1.daily_close
from  (select * from daily_transaction where daily_transaction.date_of_transaction = curdate() -1) p1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 2)) p2
WHERE (p1.company_name = p2.company_name and p1.daily_close > p2.daily_close)) k1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 3)) k2
WHERE (k1.company_name = k2.company_name and k1.daily_close > k2.daily_close);

select m1.company_name, m1.daily_close
from  (select k1.company_name, k1.daily_close
from  (select p1.company_name, p1.daily_close
from  (select * from daily_transaction where daily_transaction.date_of_transaction = curdate() -1) p1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 2)) p2
WHERE (p1.company_name = p2.company_name and p1.daily_close > p2.daily_close)) k1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 3)) k2
WHERE (k1.company_name = k2.company_name and k1.daily_close > k2.daily_close)) m1, 
(select * from daily_transaction where daily_transaction.date_of_transaction = (curdate() - 4)) m2
WHERE (m1.company_name = m2.company_name and m1.daily_close > m2.daily_close);

Chart ink,

anand raati
etf



