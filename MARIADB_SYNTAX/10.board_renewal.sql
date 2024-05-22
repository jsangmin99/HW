CREATE TABLE author(
	id bigint(20) not null auto_increment primary key,
	name varchar(255) not null,
	email varchar(255) not null,
	pw varchar(255) not null,
	created_time datetime default current_timestamp not null
);


CREATE TABLE post(
	id bigint(20) not null auto_increment primary key,
	title varchar(255) not null,
	contents varchar(255)
);

CREATE TABLE author_post(
	id bigint(20) not null auto_increment primary key,
	author_id bigint(20) not null,
	post_id bigint(20) not null,
	foreign key(author_id) references author(id),
	foreign key(post_id) references post(id)
);

CREATE TABLE author_address(
	id bigint(20) not null auto_increment primary key,
	city varchar(255) not null,
	street varchar(255) not null,
	author_id bigint(20) not null UNIQUE,
	foreign key(author_id) references author(id) on delete cascade
);