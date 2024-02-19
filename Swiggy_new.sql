Select * From swiggy


--- How many Restaurants have a rating greater than 4.5 

        select  COUNT(DISTINCT restaurant_name) AS rating_restaurant  From swiggy
		 Where rating > 4.5 
		
		select DISTINCT restaurant_name From swiggy
		 Where rating > 4.5
		 
------ Which is the TOP 1 City with the highest number of restaurants


              select TOP 1  COUNT(DISTINCT restaurant_name) AS restaurant ,city From swiggy
			  Group by city
			  order by restaurant DESC

------ How many restaurants have the word "PIZZA" in their name.

              
			   select COUNT(DISTINCT restaurant_name) AS No_Resturant  From swiggy
		 Where restaurant_name  LIKE '%PIZZA%'


              select DISTINCT restaurant_name  From swiggy
		 Where restaurant_name  LIKE '%PIZZA%'


------- What is the most common Cuisine among the restaurants in the data set.

Select * From swiggy

Select DISTINCT restaurant_name,  cuisine From swiggy

Select TOp 1 cuisine, COUNT(cuisine) AS most_common_Cuisine  From swiggy
GROUP BY cuisine
ORDER BY most_common_Cuisine  DESC

----- What is the average rating of restaurants in each city.

		 Select * From swiggy

		 Select city, AVG(rating) AS AVG_rating From  swiggy
		 Group By city

--- What is the highest price of item under the recommended menu category for each restaurants.
                
				Select Top 1  restaurant_name, menu_category, MAX(price) AS highest_price  From swiggy
				Where menu_category = 'recommended'
				Group by restaurant_name , menu_category
				Order by highest_price DESC;
				 
----------Find the TOP 5 most expensive restaurants that offer cusine other than indian cuisine.

    Select * From swiggy

	       Select TOP 5  Restaurant_name, MAX(cost_per_person)  As Expensive From swiggy
		   Where Cuisine <> 'Indian'
		   group by restaurant_name
		   order by Expensive DESC
		   
---Find the restaurants that have an average cost which is higher than the total average cost of all restaurants together.

    Select * From swiggy
	Select Distinct restaurant_name, cost_per_person From swiggy
	Where cost_per_person > (Select AVG(cost_per_person) From swiggy)

------Retrieve the details of restaurants that have the same name but are located in different cities.
           Select distinct t1.restaurant_name, t1.city As '2nd Location' ,t2.city 
AS 'ISt location' From swiggy AS t1
		   join swiggy AS t2
		   ON t1.restaurant_name = t2.restaurant_name
		   AND t1.city < > t2.city


-----  Which restaurant offers the most number of items in the MAIN COURSE category.

Select TOP 1 restaurant_name, COUNT(menu_category) AS 'No_Main Course' FROm swiggy
where menu_category = 'Main Course'
group by restaurant_name
order by COUNT(menu_category)  DESC

 

------    List the name of restaurants that are 100% vegetarian in alphabetical order of restaurant name.
 
         select Distinct restaurant_name, (COUNT
		 (CASE When veg_or_non_veg = 'Veg' THEN 1
		 END)* 100/ COUNT(*))  AS vegetarian_percentage From Swiggy
		   group by restaurant_name
		  Having 'vegetarian_percentage' = 100.00
		 order by restaurant_name;
		                 
						 select distinct restaurant_name,
(count(case when veg_or_nonveg='Veg' then 1 end)*100/
count(*)) as vegetarian_percetage
from swiggy
group by restaurant_name
having vegetarian_percetage=100.00
order by restaurant_name;
	 

	

	 ----Which is the Restaurant providing the lowest average price for all  items.
  
  Select * From swiggy


  Select TOP 1  restaurant_name, AVG(CAST(price AS DECIMAL(8,2))) AS 'Avg price'  From swiggy
  Group By restaurant_name
  order by 'Avg price' ASC





-------- Which TOP 5 restaurant offers highest number of categories.

Select TOP 5 restaurant_name, COUNT (DISTINCT (menu_category)) AS 'Top categories' From swiggy
group by restaurant_name
order by 'Top categories' DESC

-------TOP 5 restaurant provides the highest percentage of Non-vegetarian  food.

                  
	 select  TOP 5 restaurant_name, (COUNT
		 (CASE when (veg_or_non_veg) = 'Non-Veg'  THEN 1 
				  END)*100 /count(*)) AS 'Non vegetarian %' from Swiggy
				             Group by restaurant_name
                               order by 'Non vegetarian %' DESC;
