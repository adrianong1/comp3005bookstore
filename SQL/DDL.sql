create table publisher
    (p_name        varchar(20),
     bank_acc        varchar(20),
     phone_num        numeric(10,0),
     address        varchar(20),
     email            varchar(20),
     primary key (p_name) 
    );
    
create table sales_per_author
    (author        varchar(20),
     sale_count        smallint,
     primary key (author) 
    );
    
create table sales_per_genre
    (genre            varchar(20),
     sale_count        smallint,
     primary key (genre) 
    );
     
create table registered_user
     (u_id            varchar(20),
     primary key (u_id)
     );

create table book
    (isbn            varchar(20),
     book_name        varchar(20),
     author        varchar(20),
     genre            varchar(20),
     p_name        varchar(20),
     release_year        numeric(4,0),
     num_pages        smallint,
     price            numeric(4,2),
     star_rating        numeric(1,0),
     num_stock        integer,
     sale_percent        smallint,
     primary key (isbn),
     foreign key (p_name) references publisher (p_name),
     foreign key (author) references sales_per_author (author),
     foreign key (genre) references sales_per_genre (genre)
    );

create table billing_info
    (billing_id        varchar(20),
     u_id            varchar(20),
     address        varchar(20),
     city            varchar(20),
     province        varchar(20),
     card_num        varchar(20),
     postal_code        varchar(20),
     primary key (billing_id),
     foreign key (u_id) references registered_user (u_id)
    );

create table book_order
    (order_num        varchar(20),
     curr_location    varchar(20),
     total_cost        numeric(6,2),
     billing_id        varchar(20),
     s_address        varchar(20),
     s_city        varchar(20),
     s_province        varchar(20),
     s_postal_code    varchar(20),
     primary key (order_num),
     foreign key (billing_id) references billing_info (billing_id)
    );

create table basket
    (u_id            varchar(20),
     isbn            varchar(20),
     primary key (u_id, isbn),
     foreign key (isbn) references book (isbn),
     foreign key (u_id) references registered_user (u_id)
    );
