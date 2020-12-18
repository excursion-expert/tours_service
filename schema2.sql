DROP DATABASE IF EXISTS tours;

CREATE DATABASE tours;

\c tours;

CREATE TABLE IF NOT EXISTS locations (
  id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS listings (
  id INTEGER PRIMARY KEY,
  location_id SMALLINT,
  CONSTRAINT fk_location
    FOREIGN KEY (location_id)
      REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  description VARCHAR,
  photo VARCHAR
);

CREATE TABLE IF NOT EXISTS location_categories (
  location_id SMALLINT,
  CONSTRAINT fk_location
    FOREIGN KEY (location_id)
      REFERENCES locations(id),
  category_id SMALLINT,
  CONSTRAINT fk_category
    FOREIGN KEY (category_id)
       REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS tours (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  company VARCHAR,
  description VARCHAR,
  days SMALLINT,
  hours SMALLINT,
  minutes SMALLINT,
  base_price VARCHAR,
  free_cancel SMALLINT,
  evoucher_accepted SMALLINT,
  instant_confirm SMALLINT,
  hotel_pickup SMALLINT,
  reviews SMALLINT,
  avg_rating DECIMAL(10, 2),
  bookings SMALLINT,
  languages VARCHAR,
  favorite SMALLINT,
  photo VARCHAR,
  map VARCHAR,
  category_id SMALLINT,
  CONSTRAINT fk_category
    FOREIGN KEY (category_id)
       REFERENCES categories(id),
  location_id SMALLINT,
  CONSTRAINT fk_location
    FOREIGN KEY (location_id)
      REFERENCES locations(id)
);

\COPY categories from 'pgCategoriesData.csv' delimiter '|' csv header;
\COPY locations from 'pgLocationsData.csv' delimiter '|' csv header;
\COPY listings from 'pgListingsData.csv' delimiter '|' csv header;
\COPY location_categories from 'pgLocation_CategoriesData.csv' delimiter '|' csv header;
\COPY tours from 'pgToursData.csv' delimiter '|' csv header;

create index bookings_index ON tours (bookings DESC);
create index category_index on tours (category_id);
create index location_id on tours (location_id);
create index location_category on tours (location_id, category_id);