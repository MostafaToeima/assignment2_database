create database movies_assignment_database
go 
use movies_assignment_database
go 
create schema People 
go

create table People.actor
(
act_id int primary key identity,
act_fname char(20),
act_lname char(20),
act_gender char(1)
)
go
create table People.director
(
dir_id int primary key identity,
dir_fname char(20),
dir_lname char(20)

)
go
create schema movies
go

create table movies.movie
(
mov_id int primary key identity,
mov_title char(50),
mov_year int,
mov_time int,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
)
go
create table movies.movie_cast
(
mov_id int,
act_id int ,
role char(30),

primary key(mov_id,act_id) ,
foreign key (mov_id)  references movies.movie(mov_id) , 
foreign key(act_id) references People.actor(act_id)


)
go
create table movies.movie_direction
(
mov_id int,
dir_id int,
primary key(mov_id,dir_id) ,
foreign key (mov_id)  references movies.movie(mov_id) , 
foreign key(dir_id) references People.director(dir_id)
)
go
create  schema catalog 
go
create table catalog.genres
(
gen_id int primary key identity,
gen_title char(20)
)
go
create table catalog.movie_genres
(
mov_id int,
gen_id int,

primary key(mov_id,gen_id) ,
foreign key (mov_id)  references movies.movie(mov_id) , 
foreign key(gen_id) references catalog.genres(gen_id)

)
go

create schema reviews
go
create table reviews.reviewer
(
rev_id int primary key identity,
rev_name char(30)
)
go

create table reviews.rating
(
mov_id int,
rev_id int,
rev_stars int,
num_0_ratings int,

primary key(mov_id,rev_id) ,
foreign key (mov_id)  references movies.movie(mov_id) , 
foreign key(rev_id) references reviews.reviewer(rev_id)

)
go
