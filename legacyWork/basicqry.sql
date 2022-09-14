USE residex;
SELECT * FROM user LIMIT 100;
SELECT id as hostId FROM residex.user WHERE role = 'host';
SELECT id as renterId FROM residex.user WHERE role = 'renter';
SELECT id as adId FROM residex.user WHERE role = 'admin';

SELECT (SELECT count(id) FROM residex.user WHERE role = 'host') AS hostCount,
(SELECT count(id)  FROM residex.user WHERE role = 'renter') AS hostCount,
(SELECT count(id)  FROM residex.user WHERE role = 'admin') AS adminCount;

SELECT *  FROM listing;

-- Error Code: 1366. Incorrect integer value: 'id' for column 'hostId' at row 1
-- 1 row(s) affected, 1 warning(s): 1265 Data truncated for column 'longitude' at row 1
SELECT id,location,max_occupancy,has_tv,has_ac,hostId,address,rate_per_day
 FROM listing WHERE type = 'house' AND share_space = 'wholeplace' 
 ORDER BY rate_per_day;
 
 SELECT * FROM booking INNER JOIN transaction ts ON ts.booking_id = booking.id;
 
 SELECT * FROM transaction;