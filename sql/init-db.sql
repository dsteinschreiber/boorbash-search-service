create table restaurant_info (
    restaurant_id serial primary key,
    name varchar (50),
    description varchar (250),
    rating numeric,
    pic_url varchar (1000)
);

insert into restaurant_info (name, description, rating, pic_url)
values (
        'Danny''s Burgers',
        'Best burgers in town!',
        5.0,
        'https://images.unsplash.com/photo-1565299507177-b0ac66763828?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzM3x8Zm9vZHxlbnwxfHx8fDE2NTQ4MjE1ODU&ixlib=rb-1.2.1&q=80&w=200'
       ),
       (
       'Little Italy',
       'Restaurant description for some italian restaurant',
        4.8,
       'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzfHxicnVzY2hldHRhfGVufDF8fHx8MTY1NDg5OTI2MA&ixlib=rb-1.2.1&q=80&w=200'
       );

commit;

select * from restaurant_info;