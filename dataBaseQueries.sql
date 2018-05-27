CREATE table level(
   id INT NOT NULL AUTO_INCREMENT,
   description VARCHAR(255) NOT NULL,
   title VARCHAR(50) NOT NULL,
   short_title VARCHAR(50) NOT NULL,
   PRIMARY KEY ( id )
);

insert into level (description,title,short_title) values ('Upper-Intermediate level English','Upper-Intermediate','Up_Int');
insert into level (description,title,short_title) values ('Intermediate level English','Intermediate','Int');
insert into level (description,title,short_title) values ('Pre-Intermediate Level English','Pre-Intermediate','Pre_Int');
insert into level (description,title,short_title) values ('Elementary level English','Elementary','Elem');
insert into level (description,title,short_title) values ('Advaced level English','Advanced','Advn');


CREATE table teacher(
   id INT NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(255) NOT NULL,
   age INT NOT NULL,
   phone VARCHAR(50) NOT NULL,
   address VARCHAR(50) NOT NULL,
   is_active TINYINT NOT NULL,
   PRIMARY KEY ( id )
);

insert into teacher (first_name,last_name,age,phone,address,is_active) values ('Inna','Ivanova',21,'0953489051','Saltov.Shos 220',true);
insert into teacher (first_name,last_name,age,phone,address,is_active) values ('Gennadiy','Stepanov',22,'0976433110','Nauchnaya 11',true);
insert into teacher (first_name,last_name,age,phone,address,is_active) values ('Igor','Shwed',18,'0996037987','Tobolskaya St 14',true);
insert into teacher (first_name,last_name,age,phone,address,is_active) values ('John','Nilson',18,'0996037987','New York,Mancheten St 18',true);


CREATE table groups(
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	level_id INT NOT NULL,
	teacher_id INT NOT NULL,
	capasity INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    FOREIGN KEY (level_id) REFERENCES level(id)
);

insert into groups (title,level_id,teacher_id,capasity) values ('Grop-Advanced',5,1,20);
insert into groups (title,level_id,teacher_id,capasity) values ('Grop-Elementary',4,2,20);

CREATE table user(
   id INT NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(255) NOT NULL,
   age INT NOT NULL,
   phone VARCHAR(50) NOT NULL,
   address VARCHAR(50) NOT NULL,
   is_active TINYINT NOT NULL,
   level_id INT NOT NULL,
   group_id  INT NOT NULL,
   PRIMARY KEY (id ),
   FOREIGN KEY (level_id) REFERENCES level(id),
   FOREIGN KEY (group_id) REFERENCES groups(id)
);

insert into user (first_name,last_name,age,phone,address,is_active,level_id,group_id) values ('Ivan','Ivanov',21,'0953489051','Saltov.Shos 252',true,3,1);
insert into user (first_name,last_name,age,phone,address,is_active,level_id,group_id) values ('Andrey','Andreev',22,'0976433110','Gagarina street 119',true,2,1);
insert into user (first_name,last_name,age,phone,address,is_active,level_id,group_id) values ('Atem','Artemov',18,'0996037987','Komsomol. Shos 54',true,4,1);
insert into user (first_name,last_name,age,phone,address,is_active,level_id,group_id) values ('Arsen','Arsenov',18,'0996037987','Komsomol. Shos 57',true,4,2);



CREATE table request(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);




