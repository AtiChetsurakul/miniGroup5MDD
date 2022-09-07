USE airbnbmock;
DROP TABLE IF exists `calendar`;
CREATE TABLE `calendar` (
`cdate` date NOT NULL DEFAULT '2015-01-01',
`cday` int(2) unsigned NOT NULL DEFAULT '1',
`cmonth` int(2) unsigned NOT NULL DEFAULT '1',
`cyear` int(4) unsigned NOT NULL DEFAULT '2000',
PRIMARY KEY (`cdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF exists ints;
CREATE TABLE ints (i INTEGER);
INSERT INTO ints VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

INSERT INTO calendar (cdate, cday, cmonth, cyear)
SELECT cal.date as cdate, DAY(cal.date) as cday, MONTH(cal.date) as cmonth, YEAR(cal.date) as cyear
FROM (
SELECT '2020-01-01' + INTERVAL d.i*1000 + c.i* 100 + a.i * 10 + b.i DAY as date
FROM ints a JOIN ints b JOIN ints c JOIN ints d
ORDER BY d.i*1000 + c.i*100 + a.i*10 + b.i) cal
WHERE cal.date BETWEEN '2020-01-01' AND '2030-12-31';












-- USE airbnbmock;
-- DROP TABLE IF exists `calendar`;
-- CREATE TABLE `calendar` (
-- `cdate` date NOT NULL DEFAULT '2015-01-01',
-- `cday` int(2) unsigned NOT NULL DEFAULT '1',
-- `cmonth` int(2) unsigned NOT NULL DEFAULT '1',
-- `cyear` int(4) unsigned NOT NULL DEFAULT '2000',
-- PRIMARY KEY (`cdate`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP TABLE IF exists ints;
-- CREATE TABLE ints (i INTEGER);
-- INSERT INTO ints VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

-- INSERT INTO calendar (cdate, cday, cmonth, cyear)
-- SELECT cal.date as cdate, DAY(cal.date) as cday, MONTH(cal.date) as cmonth, YEAR(cal.date) as cyear
-- FROM (
-- SELECT '2020-01-01' + INTERVAL d.i*1000 + c.i* 100 + a.i * 10 + b.i DAY as date
-- FROM ints a JOIN ints b JOIN ints c JOIN ints d
-- ORDER BY d.i*1000 + c.i*100 + a.i*10 + b.i) cal
-- WHERE cal.date BETWEEN '2020-01-01' AND '2030-12-31';




