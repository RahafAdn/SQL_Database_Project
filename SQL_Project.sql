# Create database named " store ".
create database store;

# Create table countries.
Create table countries(
    code int primary key,
    name varchar(20) unique,
    continent_name varchar (20) not null
);

# Create table users.
Create table users(
    id int primary key,
    full_name varchar(20),
    email varchar(20) unique,
    gender varchar(20) check(gender='m' or gender='f'),
    date_of_birth varchar(15),
    created_at datetime,
    country_code int,
    foreign key(country_code) references countries(code)
);


# Create table orders.
Create table orders(
    id int primary key,
    user_id int,
    status varchar(6) check(status='start' or status='finish'),
    created_at datetime,
    foreign key(user_id) references users(id)
);

# Create table order_products.
Create table order_products(
    order_id int,
    product_id int,
    foreign key(order_id) references orders(id),
    foreign key(product_id) references products(id),
    primary key (order_id,product_id),
    quantity int default 0
);

# Create table products.
Create table products(
    id int primary key,
    name varchar(10) not null ,
    price int default 0,
    status varchar(10) check(status='valid' or status='expired'),
    created_at timestamp NOT NULL DEFAULT NOW()
);

#DML
# Add new row to the countries table.
insert into countries values ('1','Rahaf','Europe');
select * from countries;
# Add new row to the users table.

insert into users values ('123','Rahaf Alhazmi','rahaf@gmail.com','f','9-9-1997', NOW(),'1');
select * from users;

# Add new row to the orders table.
insert into orders values ('111',123,'start', NOW());
select * from orders;

# Add new row to the products table.
insert into products values ('105','Yara',15,'expired', NOW());
select * from products;

# Add new row to the order_products table.
insert into order_products values ('111','105',45);
select * from order_products;


# Update row from countries table.
update countries set continent_name='Australia' where code ='1';
select * from countries;


# Delete row from products table.
delete from products where id = 105 ;

