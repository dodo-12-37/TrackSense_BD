-- drop database tracksense;
-- CREATE DATABASE tracksense;
use tracksense;
INSERT INTO user (Userlogin) VALUES ('admin');

INSERT INTO Location (Latitude, Longitude,Speed)
VALUES
		('46.778180','-71.313940',12),
      ('46.776400','-71.311460',14),
      ('46.776300','-71.311290',13),
      ('46.775700','-71.310500',17),
      ('46.776310','-71.309140',14),
      ('46.776850','-71.308050',19),
      ('46.777440','-71.306990',21),
      ('46.777660','-71.306620',5),
      ('46.777970','-71.305950',2),
      ('46.778460','-71.304770',11),
      ('46.779240','-71.303370',17),
      ('46.779580','-71.302590',19),
      ('46.779870','-71.301810',14),
      ('46.780690','-71.299830',14),
      ('46.781420','-71.298130',18),
      ('46.782220','-71.295470',19);
INSERT INTO PlannedRide (PlannedRideId, Userlogin)
VALUES
    ('2854D652-F4FB-EB65-6807-A49E7A031D6E', 'admin'),
    ('9953DE61-59FF-8AB9-DB8D-8431D862448B', 'admin'),
    ('91782BEA-2302-E83A-79DD-199B04ED8390', 'admin'),
    ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA', 'admin');
INSERT INTO CompletedRide (CompletedRideId, Userlogin, PlannedRideId)
VALUES
    ('2854D652-F4FB-EB65-6807-A49E7A031D6E', 'admin', '2854D652-F4FB-EB65-6807-A49E7A031D6E'),
    ('9953DE61-59FF-8AB9-DB8D-8431D862448B', 'admin', '9953DE61-59FF-8AB9-DB8D-8431D862448B'),
    ('91782BEA-2302-E83A-79DD-199B04ED8390', 'admin', '91782BEA-2302-E83A-79DD-199B04ED8390'),
    ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA', 'admin', '558F58E2-9F83-CAF2-93C7-82859BEE6ECA'); 
INSERT INTO CompletedRidePoint (completedRideId,LocationId,RideStep,Temperature,Date)
VALUES
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',2,1,24,'2023-09-14 17:48:10'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',4,2,25,'2023-09-14 18:23:34'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',5,3,21,'2023-09-14 18:40:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',1,4,24,'2023-09-14 18:44:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',6,5,27,'2023-09-14 18:50:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',7,6,26,'2023-09-14 18:43:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',8,7,25,'2023-09-14 18:57:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',9,3,24,'2023-09-14 18:20:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',10,4,23,'2023-09-14 18:25:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',11,2,28,'2023-09-14 18:26:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',12,2,22,'2023-09-14 18:27:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',13,4,21,'2023-09-14 18:29:08'),
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',14,5,22,'2023-09-14 18:33:08'),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B',4,5,27,'2023-09-14 18:33:08'),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B',1,6,25,'2023-09-14 18:42:08'),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B',5,2,23,'2023-09-14 18:44:08'),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B',6,3,23,'2023-09-14 18:46:08'),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B',7,4,22,'2023-09-14 18:50:08'),
  ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA',3,4,25,'2023-09-14 18:43:08'),
  ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA',2,5,20,'2023-09-14 18:55:08');
use tracksense;
select * from completedRide;
select * from completedridepoint;
select * from plannedRIdePoint;
select * from location;