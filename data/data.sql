-- Create a new database
CREATE DATABASE solar_data_db;

-- Use the new database
USE solar_data_db;

-- Create the solar_data table
CREATE TABLE solar_data (
    state VARCHAR(2) PRIMARY KEY,
    sunlight INT NOT NULL,
    kilowatthour DECIMAL(5, 2) NOT NULL
);

-- Create a temporary table to hold unique data
CREATE TEMPORARY TABLE temp_data (
    state VARCHAR(2) PRIMARY KEY,
    sunlight INT NOT NULL,
    kilowatthour DECIMAL(5, 2) NOT NULL
);

-- Insert data into the temporary table, skipping duplicates
INSERT INTO
    temp_data (state, sunlight, kilowatthour)
VALUES ('AP', 2641, 12.08),
    ('AR', 2061, 21.42),
    ('AS', 3806, 12.70),
    ('BR', 2771, 10.28),
    ('CH', 3055, 18.49),
    ('GA', 3204, 12.43),
    ('GJ', 2585, 19.78),
    ('HR', 2594, 12.99),
    ('HP', 2594, 12.30),
    ('JH', 2927, 11.18),
    ('KA', 2986, 12.29),
    ('KL', 2584, 28.04),
    ('MP', 2993, 10.81),
    ('MH', 2567, 12.06),
    ('MN', 2440, 11.27),
    ('ML', 2691, 14.07),
    ('MZ', 2922, 13.06),
    ('NL', 2514, 10.28),
    ('OD', 2649, 9.06),
    ('PB', 2513, 15.87),
    ('RJ', 2582, 14.05),
    ('SK', 2634, 18.19),
    ('TG', 2711, 13.20),
    ('TR', 2720, 10.21),
    ('UP', 2690, 12.28),
    ('UT', 2698, 11.60),
    ('WB', 2762, 12.11),
    ('AN', 3646, 10.72),
    ('DN', 2499, 16.15),
    ('LD', 3415, 12.51),
    ('DL', 2120, 17.95),
    ('PY', 2651, 11.19),
    ('LA', 2738, 11.26),
    ('OH', 2183, 12.25),
    ('OK', 3089, 9.99),
    ('OR', 2341, 10.79),
    ('PA', 2614, 13.76),
    ('RI', 2606, 17.11),
    ('SC', 2826, 12.58),
    ('SD', 2947, 12.19),
    ('TN', 2510, 10.45),
    ('TX', 2850, 10.86),
    ('UT', 3029, 11.72),
    ('VT', 2295, 17.29),
    ('VA', 2829, 11.71),
    ('WB', 2170, 9.60),
    ('WV', 2594, 11.19),
    ('WI', 2428, 14.55),
    ('WY', 3073, 11.88)
ON DUPLICATE KEY UPDATE
    sunlight = VALUES(sunlight),
    kilowatthour = VALUES(kilowatthour);

-- Insert data from the temporary table into the final table
INSERT INTO
    solar_data (state, sunlight, kilowatthour)
SELECT state, sunlight, kilowatthour
FROM temp_data;

-- Drop the temporary table
DROP TEMPORARY TABLE temp_data;