CREATE TABLE pet_food
(
    id          int          not null auto_increment,
    name        varchar(100) not null,
    description varchar(300),
    price       double       not null,
    imageurl    text,
    created_at  timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    primary key (id)
);

INSERT into pet_food(name, description, price, imageurl)
values ('Chicken & Liver flavor',
        'Product Information Pedigree Chicken & Milk 3Kg - Puppy  PEDIGREE Chicken & Milk for Puppy is a wholesome meal, packed with essential nutrients vital to the healthy growth of your pet. The natural goodness of cereals, chicken, meat, soybean, carrots,...',
        1500, 'https://peppermintcafe.lk/wp-content/uploads/2018/09/Chicken-and-Liver-Flavour-1.jpg');
INSERT into pet_food(name, description, price, imageurl)
values ('Classic pet chicken flavor',
        'Product Information Pedigree Chicken & Milk 3Kg - Puppy  PEDIGREE Chicken & Milk for Puppy is a wholesome meal, packed with essential nutrients vital to the healthy growth of your pet. The natural goodness of cereals, chicken, meat, soybean, carrots,...',
        1500, 'https://peppermintcafe.lk/wp-content/uploads/2018/09/Chicken-and-Liver-Flavour-1.jpg');
