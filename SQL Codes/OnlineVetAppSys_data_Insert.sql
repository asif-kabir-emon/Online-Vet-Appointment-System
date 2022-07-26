-- Insert data into Vet table
INSERT INTO Vet
VALUES(111, 'Tom', 'Harij', '01112223334', 'Gombak, Selangor', '6000', '80');

INSERT INTO Vet
VALUES(112, 'Mohammad', 'Imran', '01112663334', 'Bukit Damansara, Kuala Lumpur', '6500', '90');

INSERT INTO Vet
VALUES(113, 'Nurul', 'Hushni', '01166623334', 'Medan Idaman, Selangor', '8000', '100');

INSERT INTO Vet
VALUES(114, 'Yu', 'Yan', '01112223434', 'Bukit Bintang, Kuala Lumpur', '9000', '110');

INSERT INTO Vet
VALUES(115, 'Ying', 'Yue', '01122223434', 'Bukit Bintang, Kuala Lumpur', '9000', '120');

INSERT INTO Vet
VALUES(116, 'Safa', 'Kabir', '01212223434', 'Batu Caves, Selangor', '8500', '100');

INSERT INTO Vet
VALUES(117, 'Mohammad', 'Musfiq', '01212923434', 'Batu Caves, Selangor', '7000', '70');

INSERT INTO Vet
VALUES(118, 'Mohammad', 'Latif', '01912923434', 'Ampang, Kuala Lumpur', '7500', '85');

INSERT INTO Vet
VALUES(119, 'Mohammad', 'Razak', '01219923434', 'Batu Caves, Selangor', '10000', '150');

INSERT INTO Vet
VALUES(120, 'Mohammad', 'Mubarak', '01999923434', 'Batu Caves, Selangor', '10000', '140');



-- Insert data into Owner table
INSERT INTO Owner
VALUES(1001, 'Esmee', 'Benitez', '01100000111', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1002, 'Freyja', 'Paul', '01100000112', 'Ampang, Selangor');

INSERT INTO Owner
VALUES(1003, 'Mohammad', 'Iman', '01100000113', 'Bandar Baru Bangi, Selangor');

INSERT INTO Owner
VALUES(1004, 'Mohammad', 'Asraf', '01100000114', 'Banting, Selangor');

INSERT INTO Owner
VALUES(1005, 'Mohammad', 'Arif', '01100001114', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1006, 'Danial', 'Hakim', '01100000115', 'Medan Idaman, Selangor');

INSERT INTO Owner
VALUES(1007, 'Raihan', 'Kabir', '01100000116', 'Batu Caves, Selangor');

INSERT INTO Owner
VALUES(1008, 'Mohammad', 'Hahmid', '01100001116', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1009, 'Mohammad', 'Rakib', '01100001117', 'Bukit Nasa, Kuala Lumpur');

INSERT INTO Owner
VALUES(1010, 'Abdur', 'Rahman', '01100000118', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1011, 'Abdur', 'Salem', '01100010118', ' ');



-- Insert data into Pet table
INSERT INTO Pet
VALUES(1101, 1001, 'Mini', 'cat', 2, 'white');

INSERT INTO Pet
VALUES(1102, 1002, 'Luna', 'cat', 5, 'brown');

INSERT INTO Pet
VALUES(1103, 1002, 'Teddy', 'dog', 7, 'orange');

INSERT INTO Pet
VALUES(1104, 1003, 'Bill', 'dog', 4, 'black');

INSERT INTO Pet
VALUES(1105, 1004, 'Bella', 'dog', 5, 'brown');

INSERT INTO Pet
VALUES(1106, 1004, 'Buddy', 'dog', 2, 'white');

INSERT INTO Pet
VALUES(1107, 1008, 'Milo', 'cat', 1, 'orange');

INSERT INTO Pet
VALUES(1108, 1005, 'Loki', 'cat', 2, 'black');

INSERT INTO Pet
VALUES(1109, 1006, 'Oliver', 'cat', 5, 'white');

INSERT INTO Pet
VALUES(1110, 1007, 'Bubba', 'bird', 1, 'green');

INSERT INTO Pet
VALUES(1111, 1009, 'Baldy', 'cat', 3, 'black');

INSERT INTO Pet
VALUES(1112, 1010, 'Putih', 'cat', 5, 'black');



-- Insert data into Pet_Condition table
INSERT INTO Pet_Condition
VALUES(1101, 'Good health');

INSERT INTO Pet_Condition
VALUES(1102, 'Not good');

INSERT INTO Pet_Condition
VALUES(1104, 'Ringworm');

INSERT INTO Pet_Condition
VALUES(1107, 'Psittacosis');

INSERT INTO Pet_Condition
VALUES(1112, 'Diabetes');

INSERT INTO Pet_Condition
VALUES(1111, 'Heartworm');



-- Insert data into Appointment table
INSERT INTO Appointment
VALUES(10001, 1001, 1101, to_date('11/07/22', 'dd/mm/yy'), '11.00 am', null, 111);

INSERT INTO Appointment
VALUES(10002, 1002, 1102, to_date('14/07/22', 'dd/mm/yy'), '10.00 am', 'Rash on Skin', 111);

INSERT INTO Appointment
VALUES(10003, 1003, 1104, to_date('09/07/22', 'dd/mm/yy'), '12.00 pm', null, 112);

INSERT INTO Appointment
VALUES(10004, 1004, 1105, to_date('14/07/22', 'dd/mm/yy'), '05.00 pm', null, 114);

INSERT INTO Appointment
VALUES(10005, 1006, 1109, to_date('18/07/22', 'dd/mm/yy'), '10.00 am', 'Rash on Skin', 119);

INSERT INTO Appointment
VALUES(10006, 1010, 1112, to_date('20/07/22', 'dd/mm/yy'), '11.00 am', null, 120);

INSERT INTO Appointment
VALUES(10007, 1009, 1111, to_date('15/07/22', 'dd/mm/yy'), '09.00 am', null, 118);

INSERT INTO Appointment
VALUES(10008, 1008, 1107, to_date('13/07/22', 'dd/mm/yy'), '01.00 pm', null, 112);

INSERT INTO Appointment
VALUES(10009, 1002, 1103, to_date('14/07/22', 'dd/mm/yy'), '10.00 am', null, 111);

INSERT INTO Appointment
VALUES(10010, 1005, 1108, to_date('10/07/22', 'dd/mm/yy'), '11.00 am', 'Diabates', 114);





