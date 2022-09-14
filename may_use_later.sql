UPDATE booking b
JOIN listing l
ON l.id = b.listing_id
SET b.booking_date = '2022-08-14 02:17:05'
WHERE l.hostId=584;

UPDATE booking b
JOIN listing l
ON l.id = b.listing_id
SET b.booking_date = '2022-08-14 02:17:05'
WHERE l.hostId=584
and b.id =77 or b.id=139 or b.id=150 or b.id=177;