USE airbnbmock;
SELECT id as hostId FROM airbnbmock.user WHERE role = 'host';
SELECT id as renterId FROM airbnbmock.user WHERE role = 'renter';
SELECT id as adId FROM airbnbmock.user WHERE role = 'admin';

SELECT (SELECT count(id) FROM airbnbmock.user WHERE role = 'host') AS hostCount,
(SELECT count(id)  FROM airbnbmock.user WHERE role = 'renter') AS hostCount,
(SELECT count(id)  FROM airbnbmock.user WHERE role = 'admin') AS adminCount;


-- Error Code: 1366. Incorrect integer value: 'id' for column 'hostId' at row 1
-- 1 row(s) affected, 1 warning(s): 1265 Data truncated for column 'longitude' at row 1
SELECT * FROM listing ;