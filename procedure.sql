-- Выборка по самому популярному мастеру

SELECT ID, name from masters 
WHERE masters.ID = (SELECT master_id FROM orders GROUP BY master_id LIMIT 1);


-- Выборка мастера по округу

SELECT ID, name, adress from masters 
WHERE adress = 'UAO';

-- Выборка веселого мастера 

SELECT name from masters
WHERE  ID in (SELECT ID from details_masters WHERE positive = 1);


-- выборка мастера, услуги которого стоят меньше 1000

SELECT name from masters WHERE  price < 1000;


-- выборка из разных таблиц данных по имени фамилии и остатку на счете, отсортированных по столбцу account  в порядке убывания  

SELECT firstname, lastname, account  FROM USERS
JOIN profiles 
WHERE USERS.ID = profiles.ID ORDER BY account DESC;


-- Отзывы, где запись к мастеру

SELECT name_salon, text_about_salon, country FROM salon
JOIN masters 
WHERE salon.country in (SELECT adress FROM masters WHERE ID in (SELECT master_id FROM orders 
JOIN USERS 
WHERE orders.pay_info = 1  and orders.ID = USERS.ID)) and salon.ID = masters.ID;


-- транзакция заказа


START TRANSACTION; 
SELECT account from profiles WHERE ID = '2';
UPDATE profiles SET account = account - '1000' WHERE ID = '3';
UPDATE profiles SET account = account + '1000' WHERE user_level = '0';
COMMIT;


-- процедура с отзывами


DROP procedure if exists salon_offers
delimiter //
CREATE procedure salon_offers(IN for_user_id BIGINT)
begin
	
SELECT name_salon, text_about_salon, country FROM salon
JOIN masters 
WHERE salon.country in (SELECT adress FROM masters WHERE ID in (SELECT master_id FROM orders 
JOIN USERS 
WHERE orders.pay_info = 1  and orders.ID = USERS.ID)) and salon.ID = masters.ID;
	
end//
delimiter ;

CALL salon_offers(1);
