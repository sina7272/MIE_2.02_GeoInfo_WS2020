/* Create table Sells */

DROP TABLE public."Sells";

CREATE TABLE public."Sells"
(
    bar character(50),
    beer character(50),
    price decimal(7, 2)
)
WITH (
    OIDS = FALSE
);

/*
decimal(p,s)	Fixed precision and scale numbers.
Allows numbers from -10^38 +1 to 10^38 –1.

The p parameter indicates the maximum total number of digits that can be stored (both to the left and to the right of the decimal point). 
p must be a value from 1 to 38. Default is 18.

The s parameter indicates the maximum number of digits stored to the right of the decimal point. 
s must be a value from 0 to p. Default value is 0
*/


/* 
ALTER TABLE public."Sells"
OWNER to env_user;
*/

INSERT INTO public."Sells" values ('Joe’s', 'Bud', 2.50);
INSERT INTO public."Sells" values ('Joe’s', 'Miller', 2.75);
INSERT INTO public."Sells" values ('Sue’s', 'Bud', 2.50);
INSERT INTO public."Sells" values ('Sue’s', 'Coors', 3.00);


DROP TABLE public."Bars";

/* 
	CREATE TABLE "Bars"
	... instead of 
	CREATE TABLE public."Bars". 
	The schema "public" is the default schema. 
*/

CREATE TABLE "Bars"
(
    name character(50),
    addr character(50)
)
WITH (
    OIDS = FALSE
);

INSERT INTO "Bars" values ('Joe’s', 'Maple St.');
INSERT INTO "Bars"(name) values ('Sue’s');
UPDATE "Bars" SET "addr" = 'River Rd.' WHERE "name" = 'Sue’s';
