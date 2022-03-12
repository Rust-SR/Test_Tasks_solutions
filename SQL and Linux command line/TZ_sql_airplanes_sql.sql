-- ������� ������� airplanes
create table airplane (
	airplane_id serial primary key,
	model varchar(30) unique not null
);

-- ������ ������ ���������
insert into airplane(model)
values ('Boeing'), ('�����'), ('Airbus');
-- ������� ������� pilot
create table pilot (
	pilot_id serial primary key,
	first_name varchar(30),
	last_name varchar(30)	
);

-- ������ ����� �������
insert into pilot(first_name, last_name)
values ('������', '�������'); 
insert into pilot(first_name, last_name)
values ('����', '���');
insert into pilot(first_name, last_name)
values ('����', '���');
insert into pilot(first_name, last_name)
values ('����', '������');
insert into pilot(first_name, last_name)
values ('���', '��������');

-- ������� ������� airplane_pilot � ������������� ����� ����� ����� ���������
create table airplane_pilot (
	id serial primary key,
	pilot_id int not null,
	airplane_id int not null,
	flight_date varchar(30) not null,
	foreign key (pilot_id)
		references pilot(pilot_id),
	foreign key (airplane_id)
		references airplane(airplane_id)
);

-- ������ ������ � ������� �������� ������������� ��
insert into airplane_pilot(pilot_id, airplane_id, flight_date)
values (1, 1, '2022-02-28'),
(2, 1, '2022-02-28'),
(1, 1, '2022-02-28'),
(3, 1, '2022-02-28'),
(4, 2, '2022-02-28'),
(5, 2, '2022-02-28'),
(4, 2, '2022-02-28'),
(1, 1, '2022-02-28');

-- ������� ���������� ������� �� Boeing ������� ������
select count(*) as Boeing_Flights, pilot.first_name, pilot.last_name
from airplane_pilot
join pilot on airplane_pilot.pilot_id=pilot.pilot_id
join airplane on airplane_pilot.airplane_id=airplane.airplane_id
where airplane.airplane_id = 1
group by pilot.first_name, pilot.last_name;

