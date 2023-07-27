--Initial Create
CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "sale_invoice" (
  "sale_id" SERIAL primary key,
  "car_id" Integer unique,
  "customer_id" Integer,
  foreign key(customer_id) references customer(customer_id),
  "salesperson_id" Integer,
  foreign key (salesperson_id) references salesperson(salesperson_id),
  "price" numeric(8,2)
  );
 
 CREATE TABLE "car" (
  "car_id" SERIAL primary key,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "year" VARCHAR(100),
  "color" VARCHAR(100),
  "customer_id" Integer,
  foreign key(customer_id) references customer(customer_id)
);
 
 CREATE TABLE "service_invoice" (
  "service_id" SERIAL,
  "mechanic_id" Integer,
  foreign key(mechanic_id) references mechanic(mechanic_id),
  "service_price" numeric(8,2),
  "service_info" VARCHAR(500),
  "parts_needed" VARCHAR(200),
  "car_id" Integer,
  foreign key(car_id) references car(car_id),
  PRIMARY KEY ("service_id")
); 
 
