DROP TABLE Vet CASCADE CONSTRAINTS;
DROP TABLE Owner CASCADE CONSTRAINTS;
DROP TABLE Pet CASCADE CONSTRAINTS;
DROP TABLE Pet_Condition CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;


CREATE TABLE Vet (
    Vet_ID NUMBER(3),
    V_fName VARCHAR2(20) NOT NULL,
    V_lName VARCHAR2(20) NOT NULL,
    V_Phone VARCHAR2(12) UNIQUE,
    V_Address VARCHAR2(50),
    Salary_Per_Mon NUMBER(6) NOT NULL,
    Charge_Per_App NUMBER(3) NOT NULL,
    CONSTRAINT Vet_VetID_PK PRIMARY KEY (Vet_ID)
);

CREATE TABLE Owner (
    Owner_ID NUMBER(4),
    O_fName VARCHAR2(20) NOT NULL,
    O_lName VARCHAR2(20) NOT NULL,
    O_Phone VARCHAR2(12) UNIQUE,
    O_Address VARCHAR2(50) NOT NULL,
    CONSTRAINT Owner_OwnerID_PK PRIMARY KEY (Owner_ID)
);

CREATE TABLE Pet (
    Pet_ID NUMBER(4),
    Owner_ID NUMBER(4),
    Pet_Name VARCHAR2(25) NOT NULL,
    Pet_Type VARCHAR2(10) CHECK(lower(Pet_Type) IN ('dog', 'cat', 'bird', 'rabbit', 'fish', 'Cow', 'Goat', 'reptile')),
    Pet_Age NUMBER(2),
    Pet_Primary_Color VARCHAR2(15),
    CONSTRAINT Pet_PetID_PK PRIMARY KEY (Pet_ID),
    CONSTRAINT Pet_OwnerID_FK FOREIGN KEY (Owner_ID) REFERENCES Owner
);

CREATE TABLE Pet_Condition (
    Pet_ID NUMBER(4),
    Pet_Condition VARCHAR2(50),
    CONSTRAINT PetCondition_PetID_PK PRIMARY KEY (Pet_ID),
    CONSTRAINT PetCondition_PetID_FK FOREIGN KEY (Pet_ID) REFERENCES Pet
);


CREATE TABLE Appointment (
    Appointment_ID NUMBER(5),
    Owner_ID NUMBER(4),
    Pet_ID NUMBER(4),
    "Date" DATE,
    "Time" VARCHAR2(20),
    "Comment" VARCHAR2(40),
    Vet_ID NUMBER(3),
    CONSTRAINT Appointment_AppID_PK PRIMARY KEY (Appointment_ID),    
    CONSTRAINT Appointmemt_OwnerID_FK FOREIGN KEY (Owner_ID) REFERENCES Owner ON DELETE CASCADE,
    CONSTRAINT Appointmemt_PetID_FK FOREIGN KEY (Pet_ID) REFERENCES Pet,
    CONSTRAINT Appointmemt_VetID_PK FOREIGN KEY (Vet_ID) REFERENCES Vet
);

