create table games
(
    gameId      varchar(100) primary key,
    title       varchar(150) not null ,
    description varchar(500),
    version     varchar(20) not null,
    size        double precision
);

create table tokens
(
    id    varchar(50) primary key,
    login varchar(25) not null,
    token varchar(50) not null
);

create table users
(
    login    varchar(25) primary key,
    password varchar(25) not null,
    username varchar(30) not null,
    email    varchar(30)
);