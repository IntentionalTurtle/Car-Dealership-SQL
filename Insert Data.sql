
insert into mechanic(mechanic_id, first_name, last_name)
values(1, 'Rod', 'Piston');

insert into mechanic(mechanic_id, first_name, last_name)
values(2, 'Barry', 'Skilled');

insert into customer
values(1, 'Mr', 'Moneybags');

insert into customer
values(2, 'King', 'Cole');

insert into customer
values(3, 'Boss', 'Baby');

insert into salesperson 
values(1, 'Tom', 'Thompson');

insert into salesperson
values(2, 'Bill', 'Billson');

create or replace function _add_car(_car_id Integer, _make VARCHAR(100), _model VARCHAR(100), _year integer, _color VARCHAR(100), _customer_id Integer)
returns void
as $main$
begin
	insert into car(car_id, make, model, year, color, customer_id)
	values(_car_id, _make, _model, _year, _color, _customer_id);
end;
$main$
language plpgsql;



select _add_car(1, 'toyota', 'camry', 2005, 'white', 3);
select _add_car(2, 'ford', 'f150', 2008, 'red', 2);
select _add_car(3, 'hyundai', 'sonata', 2015, 'green', 1);


create or replace function _add_service_invoice(_service_id Integer,_mechanic_id integer, _car_id integer, _service_price numeric(8,2),_service_info VARCHAR(500),_parts_needed VARCHAR(200))
returns void
as $main$
begin
	insert into service_invoice(service_id, mechanic_id, car_id, service_price, service_info, parts_needed)
	values(_service_id, _mechanic_id, _car_id, _service_price, _service_info, _parts_needed);
end;
$main$
language plpgsql;

select _add_service_invoice(2,1,1,120.50,'Oil Change','Oil Filter');
select _add_service_invoice(3,2,2,240,'Oil Change and Tire Rotation','Oil Filter');
select _add_service_invoice(4,2,1,0,'Recall Part 001','Door Control Arm');
select _add_service_invoice(5,1,3,120.50,'Oil Change','Oil Filter');
select _add_service_invoice(6,2,1,850,'Repaint Door','Paint - Cherry Red');
select _add_service_invoice(7,1,2,450.75,'Mud Guard Replacement','Mud Guard');




create or replace function add_sale_invoice(_sale_id Integer, _car_id integer, _customer_id Integer, _salesperson_id integer, _price numeric(8,2))
returns void
as $main$
begin
	insert into sale_invoice(sale_id, car_id, customer_id, salesperson_id, price)
	values (_sale_id, _car_id, _customer_id, _salesperson_id, _price);
end;
$main$
language plpgsql;

select add_sale_invoice(1, 1, 1, 1, 34999.99);
select add_sale_invoice(2, 2, 2, 2, 14555);
select add_sale_invoice(3, 3, 1, 2, 25000);




