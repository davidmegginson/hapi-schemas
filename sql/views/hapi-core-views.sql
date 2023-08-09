DROP VIEW IF EXISTS OrgView;

CREATE VIEW OrgView AS
SELECT O.*, OT.description AS org_type_description
FROM Org O
LEFT JOIN OrgType OT ON O.org_type_code=OT.code;

CREATE VIEW Admin2View AS
SELECT ADM2.*,
       ADM1.name AS admin1_name,
       ADM1.centroid_lat AS admin1_centroid_lat,
       ADM1.centroid_lon AS admin1_centroid_lon,
       ADM1.is_valid AS admin1_is_valid,
       ADM1.valid_date_start AS admin1_valid_date_start,
       ADM1.valid_date_end AS admin1_valid_date_end,
       LOC.name AS location_name,
       LOC.centroid_lat AS location_centroid_lat,
       LOC.centroid_lon AS location_centroid_lon,
       LOC.valid_date_start AS location_valid_date_start,
       LOC.valid_date_end AS location_valid_date_end
FROM Admin2 ADM2
LEFT JOIN Admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;

DROP VIEW IF EXISTS Admin1View;

CREATE VIEW Admin1View AS
SELECT ADM1.*,
       LOC.name AS location_name,
       LOC.centroid_lat AS location_centroid_lat,
       LOC.centroid_lon AS location_centroid_lon,
       LOC.valid_date_start AS location_valid_date_start,
       LOC.valid_date_end AS location_valid_date_end
FROM Admin1 ADM1
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;
