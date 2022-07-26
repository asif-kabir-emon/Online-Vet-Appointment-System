SET PAGES 500;
SELECT * FROM appointment;
SELECT * FROM owner;
SELECT * FROM pet;
SELECT * FROM vet;

------------------------------------ Create Procedure ------------------------------------
-- Procedure 1: Create a procedure which creates a new appointment. (It takes input of owner id, pet id, appointment date, appointment time, and vet id.)
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE makeAppointment 
    (
        o_id IN appointment.owner_id%TYPE,
        p_id IN appointment.pet_id%TYPE,
        a_date IN appointment."Date"%TYPE,
        a_time IN appointment."Time"%TYPE,
        v_id IN appointment.vet_id %TYPE
    )
    IS
    po_id owner.owner_id%TYPE;
    is_v_exist vet.vet_id%TYPE;
    is_p_exist pet.pet_id%TYPE;
    is_o_exist owner.owner_id%TYPE;
    next_appointment_id appointment.appointment_id%TYPE;
BEGIN
    SELECT MAX(appointment_id)
    INTO next_appointment_id
    FROM appointment;
    
    next_appointment_id := next_appointment_id + 1;
    
    SELECT owner_id
    INTO po_id
    FROM pet
    WHERE pet_id = p_id;
    
    SELECT COUNT(*)
    INTO is_o_exist
    FROM owner
    WHERE owner_id = o_id;
    
    SELECT COUNT(*)
    INTO is_p_exist
    FROM pet
    WHERE pet_id = p_id;
    
    SELECT COUNT(*)
    INTO is_v_exist
    FROM vet
    WHERE vet_id = v_id;
    
    IF po_id = o_id AND is_o_exist = 1 AND is_p_exist = 1 AND is_v_exist = 1 THEN
        INSERT INTO appointment(appointment_id, owner_id, pet_id, "Date", "Time", vet_id)
        VALUES(next_appointment_id, o_id, p_id, a_date, a_time, v_id);
        
        DBMS_OUTPUT.PUT_LINE('New Appointment Created Successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Your given Owner ID does not belong to the given Pet ID.');
    END IF;
END;
/


ACCEPT o_id PROMPT 'Enter Owner ID: ';
ACCEPT p_id PROMPT 'Enter Pet ID: ';
ACCEPT a_date PROMPT 'Enter Appointment date (dd/mm/yyyy): ';
ACCEPT a_time PROMPT 'Enter appointment time: ';
ACCEPT v_id PROMPT 'Enter Vet / doctor ID: ';

BEGIN
    makeAppointment(&o_id, &p_id, to_date('&a_date', 'dd/mm/yyyy'), '&a_time', &v_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given input is wrong.');
END;





-- Procedure 2: Create a procedure that can change the appointment date. (It takes input of owner id, pet id, new appointment date, new appointment time.)
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE changeAppointment 
    (
        o_id IN appointment.owner_id%TYPE,
        p_id IN appointment.pet_id%TYPE,
        u_a_date IN appointment."Date"%TYPE,
        u_a_time IN appointment."Time"%TYPE
    )
    IS
BEGIN    
    UPDATE appointment
    SET "Date" = u_a_date, "Time" = u_a_time
    WHERE owner_id = o_id AND pet_id = p_id;
        
    DBMS_OUTPUT.PUT_LINE('Update Appointment date and time Successfully.');
END;
/


ACCEPT o_id PROMPT 'Enter Owner ID: ';
ACCEPT p_id PROMPT 'Enter Pet ID: ';
ACCEPT u_a_date PROMPT 'Enter Appointment date (dd/mm/yyyy): ';
ACCEPT u_a_time PROMPT 'Enter appointment time: ';

BEGIN
    changeAppointment(&o_id, &p_id, to_date('&u_a_date', 'dd/mm/yyyy'), '&u_a_time');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given input is wrong.');
END;





-- Procedure 3: Delete the appointment. (It takes input of owner id, pet id.)
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE deleteAppointment 
    (
        o_id IN appointment.owner_id%TYPE,
        p_id IN appointment.pet_id%TYPE
    )
    IS
BEGIN    
    DELETE FROM appointment
    WHERE owner_id = o_id AND pet_id = p_id;
        
    DBMS_OUTPUT.PUT_LINE('Delete Appointment Successfully.');
END;
/


ACCEPT o_id PROMPT 'Enter Owner ID: ';
ACCEPT p_id PROMPT 'Enter Pet ID: ';

BEGIN
    deleteAppointment(&o_id, &p_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given input is wrong.');
END;




-- Procedure 4: Add a new owner. (It takes input of the owner's first name, last name, phone number, and address.)
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE newOwner 
    (
        ow_fname IN owner.o_fname%TYPE,
        ow_lname IN owner.o_lname%TYPE,
        ow_phone IN owner.o_phone%TYPE,
        ow_address IN owner.o_address%TYPE
    )
    IS
    next_ow_id owner.owner_id%TYPE;
BEGIN
    SELECT MAX(owner_id)
    INTO next_ow_id
    FROM owner;
    
    next_ow_id := next_ow_id + 1;
    
    INSERT INTO owner(owner_id, o_fname, o_lname, o_phone, o_address)
    VALUES(next_ow_id, ow_fname, ow_lname, ow_phone, ow_address);
        
    DBMS_OUTPUT.PUT_LINE('New owner created Successfully.');
END;
/


ACCEPT ow_fname PROMPT 'Enter your first name: ';
ACCEPT ow_lname PROMPT 'Enter your last name: ';
ACCEPT ow_phone PROMPT 'Enter your phone number: ';
ACCEPT ow_address PROMPT 'Enter your address: ';

BEGIN
    newOwner('&ow_fname', '&ow_lname', '&ow_phone', '&ow_address');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given input is wrong.');
END;




-- Procedure 5: Delete an owner. (It takes input of the owner's id.)
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE deleteOwner 
    (
        ow_id IN owner.owner_id%TYPE
    )
    IS
BEGIN
    DELETE FROM owner
    WHERE owner_id = ow_id;
    
    DELETE FROM pet
    WHERE owner_id = ow_id;
        
    DBMS_OUTPUT.PUT_LINE('Delete owner Successfully.');
END;
/


ACCEPT ow_id PROMPT 'Enter Owner ID: ';

BEGIN
    deleteOwner(&ow_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given input is wrong.');
END;




ROLLBACK;