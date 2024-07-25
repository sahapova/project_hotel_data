CREATE TABLE IF NOT EXISTS "hotel_2020" (
    "hotel" TEXT,
    "is_canceled" INT,
    "lead_time" INT,
    "arrival_date_year" INT,
    "arrival_date_month" TEXT,
    "arrival_date_week_number" INT,
    "arrival_date_day_of_month" INT,
    "stays_in_weekend_nights" INT,
    "stays_in_week_nights" INT,
    "adults" INT,
    "children" INT,
    "babies" INT,
    "meal" TEXT,
    "country" TEXT,
    "market_segment" TEXT,
    "distribution_channel" TEXT,
    "is_repeated_guest" INT,
    "previous_cancellations" INT,
    "previous_bookings_not_canceled" INT,
    "reserved_room_type" TEXT,
    "assigned_room_type" TEXT,
    "booking_changes" INT,
    "deposit_type" TEXT,
    "agent" TEXT,
    "company" TEXT,
    "days_in_waiting_list" INT,
    "customer_type" TEXT,
    "adr" NUMERIC(5, 2),
    "required_car_parking_spaces" INT,
    "total_of_special_requests" INT,
    "reservation_status" TEXT,
    "reservation_status_date" DATE
);

CREATE TABLE IF NOT EXISTS "hotel_discount" (
    "Discount" NUMERIC(3, 2),
    "market_segment" TEXT
);
INSERT INTO "hotel_discount" VALUES (0,'Undefined'),
	(0.1,'Direct'),
	(0.1,'Groups'),
	(0.15,'Corporate'),
	(0.2,'Aviation'),
	(0.3,'Offline TA/TO'),
	(0.3,'Online TA'),
	(1,'Complementary');


select *
from public.hotel_2020
limit 10;

select *
from public.hotel_discount;

with hotel_all as (
select *
from public.hotel_2018
union 
select *
from public.hotel_2019
union
select *
from public.hotel_2020)

select *
from hotel_all
left join public.hotel_discount
on  hotel_all.market_segment=public.hotel_discount.market_segment


