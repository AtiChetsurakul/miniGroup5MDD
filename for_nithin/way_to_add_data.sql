-- INSERT script
-- Error Code: 1364. Field 'booking_id' doesn't have a default value
USE residex;

UPDATE
    transaction ts,
    booking bk
SET
    ts.no_days = bk.no_of_days
WHERE
    ts.booking_id = bk.id
    AND
    bk.reserve_status = 'approved';
    
 SELECT * FROM transaction;