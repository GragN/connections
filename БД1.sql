create table if not exists musician (
	id serial primary key,
	name varchar(20) not null unique
);

create table if not exists album (
	id serial primary key,
	name varchar(20) not null unique,
	year_of_issue integer not null
);

create table if not exists genre (
	id serial primary key,
	name varchar(20) not null unique
);

create table if not exists GenreMusician (
	genre_id integer references genre(id),
	musician_id integer references musician(id),
	constraint GM primary key (genre_id, musician_id)
);

create table if not exists MusicianAlbum (
	musician_id integer references musician(id),
	album_id integer references album(id),
	constraint MA primary key (musician_id, album_id)
);

create table if not exists track (
	id serial primary key,
	album_id integer references album(id),
	name varchar(20) not null unique,
	duration varchar(15) not null
);

create table if not exists compilation (
	id serial primary key,
	name varchar(20) not null unique,
	year_of_issue integer not null 
);

create table if not exists TrackCompilation (
	track_id integer references track(id),
	compilation_id integer references compilation(id),
	constraint TC primary key (track_id, compilation_id)
);
