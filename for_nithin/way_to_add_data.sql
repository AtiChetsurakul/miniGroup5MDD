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
 
 -- TODO use this step to get `actual_price` from listing (rate_per_day)
 -- then update :
 -- 	the total price will be = (no_days*actual_price) - discount(we might not do `discount` yet)
 -- 	company_charge is 0.XX(percentage u want) * total_price
 -- 	host_charge is (1 - 0.XX(percentage u want)) * total_price
