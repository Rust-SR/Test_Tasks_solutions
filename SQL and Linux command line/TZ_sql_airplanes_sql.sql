-- Создаем таблицу airplanes
create table airplane (
	airplane_id serial primary key,
	model varchar(30) unique not null
);

-- Вносим модели самолетов
insert into airplane(model)
values ('Boeing'), ('Ñóõîé'), ('Airbus');
-- Создаем таблицу pilot
create table pilot (
	pilot_id serial primary key,
	first_name varchar(30),
	last_name varchar(30)	
);

-- Вносим имена пилотов
insert into pilot(first_name, last_name)
values ('Ñåðãåé', 'Øàðàïîâ'); 
insert into pilot(first_name, last_name)
values ('Ñàíÿ', 'Ñû÷');
insert into pilot(first_name, last_name)
values ('Ìàøà', 'Ñû÷');
insert into pilot(first_name, last_name)
values ('Äèìà', 'Âàëèåâ');
insert into pilot(first_name, last_name)
values ('Èðà', 'Ñìèðíîâà');

-- Создаем таблицу airplane_pilot и устанавливаем связь между всеми таблицами
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

-- Вносим данные в таблицу согласно оригинальному ТЗ
insert into airplane_pilot(pilot_id, airplane_id, flight_date)
values (1, 1, '2022-02-28'),
(2, 1, '2022-02-28'),
(1, 1, '2022-02-28'),
(3, 1, '2022-02-28'),
(4, 2, '2022-02-28'),
(5, 2, '2022-02-28'),
(4, 2, '2022-02-28'),
(1, 1, '2022-02-28');

-- Выводим количество полетов на Boeing каждого пилота
select count(*) as Boeing_Flights, pilot.first_name, pilot.last_name
from airplane_pilot
join pilot on airplane_pilot.pilot_id=pilot.pilot_id
join airplane on airplane_pilot.airplane_id=airplane.airplane_id
where airplane.airplane_id = 1
group by pilot.first_name, pilot.last_name;

