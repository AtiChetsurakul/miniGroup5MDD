-- USE residex;
-- SELECT id,location,max_occupancy,has_tv,has_ac,hostId,address,rate_per_day
--  FROM listing WHERE type = 'house' AND share_space = 'wholeplace' 
--  ORDER BY rate_per_day;
--  
-- SELECT * FROM booking 
-- WHERE reserve_status != 'rejected' AND billing_status != 'canceled' AND listing_id = 191 AND start_date > now() ;

-- insert into booking ( user_id, listing_id, booking_date, no_of_days, no_of_people, 
-- amount, reserve_status, billing_status, payment_medium, start_date, end_date, paid_to_host, fee_to_company) 
-- values 
-- ( 9, 191, NOW(), 3, 2, (SELECT rate_per_day FROM listing WHERE id = 191) * 2, 'pending', 'pending',
--  null, '2023-06-01 00:00:00', '2023-06-4 00:00:00', (SELECT rate_per_day FROM listing WHERE id = 191) * 2*0.97,
--  (SELECT rate_per_day FROM listing WHERE id = 191) * 2*0.03);
