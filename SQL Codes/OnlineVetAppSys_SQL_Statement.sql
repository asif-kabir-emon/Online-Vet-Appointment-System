SET PAGES 500;

select * from vet;
select * from pet;
select * from pet_condition;
select * from appointment;

-- List all pet owner order by their id
SELECT *
FROM owner
ORDER BY owner_id;

-- List all pet owner with their pet information
SELECT o.owner_id, o.o_fname, o.o_lname, p.pet_id, p.pet_name, p.pet_type
FROM owner o
JOIN pet p
ON o.owner_id = p.owner_id
ORDER BY o.owner_id;

-- List all the vet id, first name, last name and salary from the Vet table who have a salary per month greater than 8000.
SELECT vet_id, v_fname, v_lname, salary_per_mon
FROM VET
WHERE salary_per_mon > 8000;

-- List all the pet’s owner information from the Owner table who have more than one pet.
SELECT *
FROM owner
WHERE owner_id IN (SELECT UNIQUE(p.owner_id)
                   FROM pet p, (SELECT owner_id, COUNT(pet_id) AS cn FROM pet GROUP BY owner_id) s
                   WHERE p.owner_id = s.owner_id AND s.cn > 1);

-- List all appointment from appointment table with owners name and their pet names order by appointment date and time
SELECT a.appointment_id, a."Date", a."Time", a.owner_id, a.pet_id, o.o_fname || ' ' || o.o_lname AS owner_name, p.pet_name
FROM appointment a
LEFT JOIN owner o ON a.owner_id = o.owner_id
LEFT JOIN pet p ON a.pet_id = p.pet_id
ORDER BY a."Date", a."Time";

-- Change appointment date to 25/07/2022 where the pet's name is ‘Putih’ and it is a cat.
UPDATE appointment
SET appointment."Date" = to_date('25/07/2022', 'dd/mm/yyyy')
WHERE pet_id = (SELECT pet_id FROM pet WHERE pet_name = 'Putih' AND pet_type = 'cat');


-- List the appointment id, date, owner name, pet name, pet type order by appointment date
SELECT a.appointment_id, a."Date", CONCAT(CONCAT(o.o_fname, ' '), o.o_lname), p.pet_name, p.pet_type
FROM appointment a
LEFT JOIN owner o USING (owner_id)
LEFT JOIN pet p USING (pet_id);

-- Update pet condition where pet name is Luna and it is a cat.
UPDATE pet_condition
SET pet_condition = 'Toxoplasmosis'
WHERE pet_id = (SELECT pet_id FROM pet WHERE pet_name = 'Luna' AND pet_type = 'cat');



