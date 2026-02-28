-- Create Database
CREATE DATABASE car_sales_data;

-- Use Database
USE car_sales_data;

-- Main Query
SELECT 
    Model,
    Brand,
    purchase_place,
    Year_of_manufacture,
    
    COUNT(*) AS total_cars,

    -- % by Car Model
    ROUND(
        100.0 * COUNT(*) / 
        SUM(COUNT(*)) OVER (PARTITION BY Model),
        2
    ) AS percentage_by_model,

    -- % by Purchase Place
    ROUND(
        100.0 * COUNT(*) / 
        SUM(COUNT(*)) OVER (PARTITION BY purchase_place),
        2
    ) AS percentage_by_place,

    -- % of Total Cars
    ROUND(
        100.0 * COUNT(*) / 
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_total,

    -- Average Mileage
    ROUND(AVG(mileage), 2) AS avg_mileage

FROM car_sales_data

GROUP BY 
    Model,
    Brand,
    purchase_place,
    Year_of_manufacture,
    Engine_size

ORDER BY 
    Year_of_manufacture ASC,
    Brand ASC,
    purchase_place ASC,
    Model ASC,
    Engine_size asc;

-- View all records
SELECT * FROM car_sales_data;



