SET PAGES 500;
SELECT * FROM appointment;
SELECT * FROM owner;
SELECT * FROM pet;
SELECT * FROM vet;


--------------------------------------------------------- Create Function ---------------------------------------------------------
-- Function - 1: Create a function to give a discount on the charge of an appointment. Give 20% discount to those who live in Selangor, 10% discount to those who live in Kuala Lumpur.
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE FUNCTION getDiscount (ow_address IN owner.o_address%TYPE)
    RETURN NUMBER
    IS
    discount NUMBER;
BEGIN
    IF ow_address LIKE '%Selangor%' THEN discount := 0.2;
        ELSIF ow_address LIKE '%Kuala Lumpur%' THEN discount := 0.2;
        ELSE discount := 0;
    END IF;
    RETURN discount;
END;
/


ACCEPT ow_id PROMPT 'Enter Owner ID: ';
DECLARE
    o_id owner.owner_id%TYPE;
    ow_fname owner.o_fname%TYPE;
    ow_lname owner.o_lname%TYPE;
    ow_address owner.o_address%TYPE;
    charge_of_vet vet.charge_per_app%TYPE;    
    discount NUMBER;
    discount_bill NUMBER;
BEGIN
    o_id := &ow_id;

    SELECT charge_per_app
    INTO charge_of_vet
    FROM vet
    WHERE vet_id = (SELECT vet_id FROM appointment WHERE owner_id = o_id);
    
    SELECT o_fname, o_lname, o_address
    INTO ow_fname, ow_lname, ow_address
    FROM owner
    WHERE owner_id = o_id;
    
    discount := getDiscount(ow_address);
    discount_bill := charge_of_vet - (charge_of_vet * discount);
    
    DBMS_OUTPUT.PUT_LINE('Pet Owner Name: ' || ow_fname || ' ' || ow_lname);
    DBMS_OUTPUT.PUT_LINE('Pet Owner Address: ' || ow_address);
    DBMS_OUTPUT.PUT_LINE('Vet fee: ' || charge_of_vet);
    DBMS_OUTPUT.PUT_LINE('Eligible Discount: ' || (discount * 100) || '%' || chr(10));
    
    DBMS_OUTPUT.PUT_LINE('Vet fee after discount: ' || discount_bill);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given Owner ID does not have any appointment. Or Your given Owner ID is Invalid.');
END;




-- Function - 2: Create a function to check how many appointments a vet in a month. Function takes vet_id, month name, and year as input.
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE FUNCTION countAppiontmentOfVet 
    (
        v_id IN vet.vet_id%TYPE, 
        month_name IN VARCHAR2, 
        g_year IN VARCHAR2
    )
    RETURN NUMBER
    IS
    t_count NUMBER;
    s_date VARCHAR2(30);
    f_date VARCHAR2(30);
    
BEGIN
    IF month_name = 'January' THEN s_date := '01/01/' || g_year; f_date := '31/01/' || g_year;
        ELSIF month_name = 'February' THEN s_date := '01/02/' || g_year; f_date := '28/02/' || g_year;
        ELSIF month_name = 'March' THEN s_date := '01/03/' || g_year; f_date := '31/03/' || g_year;
        ELSIF month_name = 'April' THEN s_date := '01/04/' || g_year; f_date := '30/04/' || g_year;
        ELSIF month_name = 'May' THEN s_date := '01/05/' || g_year; f_date := '31/05/' || g_year;
        ELSIF month_name = 'June' THEN s_date := '01/06/' || g_year; f_date := '30/06/' || g_year;
        ELSIF month_name = 'July' THEN s_date := '01/07/' || g_year; f_date := '31/07/' || g_year;
        ELSIF month_name = 'August' THEN s_date := '01/08/' || g_year; f_date := '31/08/' || g_year;
        ELSIF month_name = 'September' THEN s_date := '01/09/' || g_year; f_date := '30/09/' || g_year;
        ELSIF month_name = 'October' THEN s_date := '01/10/' || g_year; f_date := '31/10/' || g_year;
        ELSIF month_name = 'November' THEN s_date := '01/11/' || g_year; f_date := '30/11/' || g_year;
        ELSIF month_name = 'December' THEN s_date := '01/12/' || g_year; f_date := '31/12/' || g_year;
        ELSE DBMS_OUTPUT.PUT_LINE('You Enter a Invalid month name.');
    END IF;

    SELECT COUNT(*)
    INTO t_count
    FROM appointment
    WHERE vet_id = v_id 
    AND "Date" BETWEEN to_date(s_date, 'dd/mm/yyyy') AND to_date(f_date, 'dd/mm/yyyy');
    
    RETURN t_count;
END;
/

ACCEPT v_id PROMPT 'Enter a Vet ID: ';
ACCEPT month_name PROMPT 'Enter a month (eg. Janurary, February ): ';
ACCEPT g_year PROMPT 'Enter the year: ';
DECLARE
    vid vet.vet_id%TYPE;
    vet_fname vet.v_fname%TYPE;
    vet_lname vet.v_lname%TYPE;
    g_month VARCHAR2(20);
    t_count NUMBER;
BEGIN
    vid := &v_id;
    g_month := '&month_name';
    
    SELECT v_fname, v_lname
    INTO vet_fname, vet_lname
    FROM vet
    WHERE vet_id = vid;
    
    t_count := countAppiontmentOfVet(vid, g_month, '&g_year');
    
    DBMS_OUTPUT.PUT_LINE(vid || ' ' || vet_fname || ' ' || vet_lname || ' have ' || t_count || ' appointment in ' ||  g_month);
END;

