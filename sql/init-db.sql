create table restaurant_info
(
    restaurant_id serial primary key,
    name          varchar(50),
    description   varchar(250),
    rating        numeric,
    pic_url       varchar(1000)
);

insert into restaurant_info (name, description, rating, pic_url)
values ('Danny''s Burgers',
        'Best burgers in town!',
        5.0,
        'https://images.unsplash.com/photo-1565299507177-b0ac66763828?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzM3x8Zm9vZHxlbnwxfHx8fDE2NTQ4MjE1ODU&ixlib=rb-1.2.1&q=80&w=200'),
       ('Little Italy',
        'Restaurant description for some italian restaurant',
        4.8,
        'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzfHxicnVzY2hldHRhfGVufDF8fHx8MTY1NDg5OTI2MA&ixlib=rb-1.2.1&q=80&w=200');

commit;

select *
from restaurant_info;

create table menu_entry
(
    restaurant_id    integer,
    division         varchar(100),
    dish_name        varchar(100),
    dish_description varchar(1000),
    price            numeric,
    dish_pic_url     varchar(1000),
    constraint fk_restaurant_info
        foreign key(restaurant_id)
        references restaurant_info(restaurant_id)
        on delete cascade
);

insert into menu_entry (restaurant_id, division, dish_name, dish_description, price, dish_pic_url)
values (
        (select restaurant_id from restaurant_info where name = 'Little Italy'),
        'Appetizers',
        'Bruschetta',
        'Tomatoes, basil, mozzarella on perfectly toasted foacaccia bread.',
        12.99,
        'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzfHxicnVzY2hldHRhfGVufDF8fHx8MTY1NDg5OTI2MA&ixlib=rb-1.2.1&q=80&w=200'
       ),
       (
        (select restaurant_id from restaurant_info where name = 'Danny''s Burgers'),
        'Burgers',
        'Mushroom Burger Deluxe',
        'A juicy, tasty, greasy load of a burger',
        15.00,
        'https://images.unsplash.com/photo-1551987840-f62d9c74ae78?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwxfHxtdXNocm9vbSUyMGJ1cmdlcnxlbnwxfHx8fDE2NTcxNTI3NDA&ixlib=rb-1.2.1&q=80&w=200'
       );
commit;

select * from menu_entry;


