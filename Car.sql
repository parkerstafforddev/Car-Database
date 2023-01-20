create table customer(
customer_id SERIAL primary key,
first_name VARCHAR(100),
lats_name VARCHAR(100),
address VARCHAR(150),
billing_info VARCHAR(150),
service_ticket INTEGER not null,
buy_id INTEGER not null

);

create table salesman (
salesman_id SERIAL primary key,
customer_id INTEGER not null,
invoice_id INTEGER,
foreign key(customer_id) references customer(customer_id)


);

create table order_(
buy_id SERIAL primary key,
buy_date DATE default current_date,
sub_total NUMERIC(8,2),
total_cost NUMERIC(10,2),
upc INTEGER not null,
foreign key(upc) references inventory(upc)

);

create table inventory( 
upc SERIAL primary key,
car_amount INTEGER

);

create table car (
car_id SERIAL primary key,
amount NUMERIC(5,2),
car_name VARCHAR(100),
brand_id INTEGER not null,
upc INTEGER not null,
foreign key(brand_id) references brand(brand_id),
foreign key(upc) references inventory(upc)
);


create table brand(
brand_id SERIAL primary key,
brand_name VARCHAR(150),
contact_number VARCHAR(15),
address VARCHAR(150)

);

create table service( 
service_ticket SERIAL primary key,
customer_id INTEGER not null,
mechanic_id INTEGER not null,
foreign key(customer_id) references customer(customer_id),
foreign key(mechanic_id) references mechanic(mechanic_id)
);


create table mechanic(
mechanic_id SERIAL primary key,
parts VARCHAR(150)


);


create table sold_cars(
sold_id SERIAL primary key,
car_id INTEGER not null,
customer_id INTEGER not null,
salesman_id INTEGER not null,
foreign key(car_id) references car(car_id),
foreign key(customer_id) references customer(customer_id),
foreign key(salesman_id) references salesman(salesman_id)
);

insert into customer(customer_id, first_name,lats_name,address,billing_info,service_ticket,buy_id)
values(1,'Micah','Bands','444 E Miles','4444-4444-4444-4444 2 444 09/24', 0, 1);
insert into customer(customer_id, first_name,lats_name,address,billing_info,service_ticket,buy_id)
values(2,'Tyler', 'Sekward', '1114 N Rocky', 'Cash', 1, 0);


select * from customer

--Function to insert data into customer table
create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _lats_name VARCHAR, _address VARCHAR, _billing_info VARCHAR, _service_ticket INTEGER, _buy_id INTEGER)
returns void
as $MAIN$
begin 
	insert into customer(customer_id, first_name, lats_name, address, billing_info, service_ticket, buy_id)
	VALUES(_customer_id,_first_name,_lats_name,_address,_billing_info,_service_ticket, _buy_id);
end;
$MAIN$
language plpgsql;


select add_customer(3,'Brayden','Gilly','1600 N Universe', 'Cash', 2, 500);

select add_customer(4,'Rider','Scott', '1242 N Good', 'Check', 3, 301);

select * from customer











