/*Chapter 3.2 level 1*/
%let path=/folders/myfolders/Data_One;
libname orion "/folders/myfolders/Data_One";
/*a. observations are 7, since there are 7 lines.
b.variables are 6, since there are 6 columns.
c.last name: South Africa. Since the last ovservation is South Africa.*/
proc contents data=orion._all_ nods;
run;
/*last name:US_SUPPLIERS, since the last observation is US_SUPPLIERS.

/*Chapter 3.2 level 2*/
proc contents data=orion.staff;
run;
/*sort information:data is sorted. The variable section indicate that it is sorted by 
Employee_ID using ANSI character set, and has been validated.

/*Chapter 3.2 challenge*/
/*name of file:autoexec.sas.
purpose:it contains SAS statements that are executed immediately after SAS initializes. The 
SAS statements can be used to invoke SAS program automatically, set up certain variables for
use during SAS session, or set system potion.
How created: use a SAS text editor and save it using the save as dialog box.
How could useful: set the path macro variable and to automatically submit a LIBNAME statement.

/*Chapter 4.1 level1
b.*/proc print data=orion.order_fact;
/*print the orion.order_fact data set*/
  sum total_retail_price; 
/*sum of the total_retail_price column*/
  run;
/*Total sum is $100,077.46
c.*/proc print data=orion.order_fact;
sum Total_Retail_Price;
where Total_Retail_Price>500;
run;
/*only collect the observations  the total_retail_price is greater than 500*/;
/*Yes, the sum changed and it is now $32,696.60
d.*/proc print data=orion.order_fact noobs;
/*print the orion.order_fact data set and removes the obs column by using noobs*/
sum Total_Retail_Price;
where Total_Retail_Price>500;
run;
/*e.*/proc print data=orion.order_fact noobs;
sum Total_Retail_Price;
where Total_Retail_Price>500;
id Customer_ID;
/* the Customer_ID as the identifying column*/
run;
/*f*/proc print data=orion.order_fact noobs;
sum Total_Retail_Price;
where Total_Retail_Price>500;
id Customer_ID;
var Customer_ID Order_ID Order_Type Quantity Total_Retail_Price;
/*displays the variables order_id twice order_type quantity and total_retail_price*/
run;
/*g*/proc print data=orion.order_fact noobs;
sum Total_Retail_Price;
where Total_Retail_Price>500;
id Customer_ID;
var Order_ID Order_Type Quantity Total_Retail_Price;
/*remove one of the order_ID from part f.*/
run;

/*Chapter 4.1 level2*/
proc print data=orion.customer_dim noobs 
/*prints the orion.customer_dim data set and removes the obs column,problem a do not
have to remove obs columns.*/;
	where Customer_Age between 30 and 40
/*selects only the customers between the ages of 30 and 40,code for part b*/;
	id Customer_ID 
/*sets the Customer_ID as the identifying column, code for part c*/;
	var Customer_Name Customer_Age Customer_Type 
/*output variable: Customer_Name Customer_Age and Customer_Type variables,part d*/;
run;

/*Chapter 4.2 level1*/
/*5a*/proc sort data=orion.employee_payroll out=work.sort_salary; 
/*reads the observations from the data set and places them into the work.sort_salary data set*/
	by Salary; 
/*sorts the data set by Salary*/
run;
/*5b*/proc print data=work.sort_salary;
/*prints the work.sort_salary data set*/
run;
/*6a*/proc sort data=orion.employee_payroll out=work.sort_salary2;
/*reads the observations from original data set and places them into the work.salary_sort2
data set which answers problem a*/;
	by Employee_Gender descending Salary;	
/*sorts by gender and within gender, by salary in descending order. code for b*/;
run;
/*6b*/proc print data=work.sort_salary2 
/*prints the sort_salary2 data set*/;
	by Employee_Gender
/*groups the sort_salary2 data set by Gender*/;
run;

/*Chapter 4.2 level1*/
/proc sort data=orion.employee_payroll out=work.sort_sal
/*reads the observations and places them into work.sort_sal*/;
	by Employee_Gender descending Salary 
/*sorts by Gender and by descending Salary within Gender*/;
run;
proc print data=work.sort_salary2 
/*prints*/;
	by Employee_Gender
/*groups*/;
run;

/*Chapter 4.2 level2*/
/*a*/proc sort data=orion.employee_payroll out=work.sort_sal;
by Employee_Gender descending Salary;
proc print data=orion.employee_payroll;
run;
/*b*/proc print data=orion.employee_payroll noobs;
/*place data into orion.employee_payroll and remove obv columns*/ 
by Employee_Gender;
/*group*/
sum Salary;
/*add salary*/
where Employee_Term_Date is missing and Salary>65000;
/*select satisfied condition*/
var Employee_ID Salary Marital_Status;
/*three variable*/
run;

/*Chapter 4.3 level1*/
title1 'Australian Sales Employees';
title2 'Senior Sales Representatives';
footnote1 'Job_Title: Sales Rep. IV';
proc print data=orion.sales noobs;
	where Country='AU' and Job_Title contains 'Rep. IV';
	var Employee_ID First_Name Last_Name Gender Salary;run;
title
footnote;
/*10a*/title 'Entry-level Sales Representatives';
footnote 'Job_Title: Sales Rep. I';
proc print data=orion.sales noobs label;
	where Country='US' and Job_Title='Sales Rep. I';
	var Employee_ID First_Name Last_Name Gender Salary;
	label Employee_ID="Employee ID"
/*change the name by using label*/
			First_Name="First Name"
			Last_Name="Last Name"
			Salary="Annual Salary";	
run;
title;
footnote;
/*10b*/title 'Entry-level Sales Representatives';
footnote 'Job_Title: Sales Rep. I';
proc print data=orion.sales noobs split=' ';
	where Country='US' and Job_Title='Sales Rep. I';
	var Employee_ID First_Name Last_Name Gender Salary;
	label Employee_ID="Employee ID"
			First_Name="First Name"
			Last_Name="Last Name"
			Salary="Annual Salary";	
run;
title;
footnote;

/*Chapter 4.3 level2*/
proc sort data=orion.employee_addresses out=work.address;
	where Country='US';
	by State City Employee_Name;
run;
title "US Employees by State";
proc print data=work.address noobs split=' ';
	var Employee_ID Employee_Name City Postal_Code;
	label Employee_ID='Employee ID'
			Employee_Name='Name'
			Postal_Code='Zip Code';
	by State;
run;

/*Chapter 5.1 level1*/
/*1a*/proc print data=orion.employee_payroll;
run;
/*1b*/proc print data=orion.employee_payroll;
var Employee_ID Salary Birth_Date Employee_Hire_Date;
run;
/*1c*/proc print data=orion.employee_payroll;
format Salary dollar12.2 Birth_Date mmddyy10. Employee_Hire_Date Date9.;
/*format regulates the format of variables*/
var Employee_ID Salary Birth_Date Employee_Hire_Date;
run;

/*Chapter 5.1 level2*/
title1 'US Sales Employees';
title2 'Earning Under $26,000';
proc print data=orion.sales noobs split=' ';
label First_Name='First Name' Last_Name='Last Name' Hire_Date='Date Hired';
format Salary dollar12.2 Hire_Date monyy7.;
var Employee_ID First_Name Last_Name Job_Title Salary Hire_Date;
where Country= 'US' and Salary<26000;
run;
title;

/*Chapter 5.2 level1*/
/*a*/data Q1Birthdays;
   set orion.employee_payroll;
   BirthMonth=month(Birth_Date);
   if BirthMonth less 3;
/* if sentence means only run birthmonth less than 3.*/
run;
/*bc*/proc format;
   value $gender
      'F'='Female'
      'M'='Male';
   value mname
       1='January'
       2='February'
       3='March';
run;
/*de*/title 'Employees with Birthdays in Q1';
proc print data=Q1Birthdays;
	var Employee_ID Employee_Gender BirthMonth;
   format Employee_Gender $gender.
          BirthMonth mname.;
run;
title;

/*Chapter 5.2 level2*/
/*abc*/roc format;
   value $gender 'F'='Female'
                 'M'='Male'
               other='Invalid code';
   value salrange .='Missing salary'
      20000-<100000='Below $100,000'
      100000-500000='$100,000 or more'
              other='Invalid salary';
run;
title1 'Salary and Gender Values';
title2 'for Non-Sales Employees';
/*d*/proc print data=orion.nonsales;
   var Employee_ID Job_Title Salary Gender;
   format Salary salrange. Gender $gender.;
run;
title;

/*Chapter 6.2 level2*/
data work.delays;
   set orion.orders;
   where Order_Date+4<Delivery_Date 
         and Employee_ID=99999999;
   Order_Month=month(Order_Date);
   if Order_Month=8;
	label Order_Date='Date Ordered'
	      Delivery_Date='Date Delivered'
			Order_Month='Month Ordered';
	format Order_Date Delivery_Date mmddyy10.;
	keep Employee_ID Customer_ID Order_Date Delivery_Date Order_Month;
run;
proc contents data=work.delays;
run;
proc print data=work.delays;
run;

/*Chapter 9.1 level2*/
data work.birthday;
set orion.customer;
Bday2012=mdy(month(Birth_Date),day(Birth_Date),2012);
BdayDOW2012=weekday(Bday2012);
Age2012=(Bday2012-Birth_Date)/365.25;
keep Customer_Name Birth_Date Bday2012 BdayDOW2012 Age2012;
format Bday2012 date9.
Age2012 3.;
run;
proc print data=work.birthday;
run;

/*Chapter 9.2 level2*/
/*6*/data work.season;
set orion.customer_dim;
if qtr(Customer_BirthDate)=1 then Promo='Winter';
else if qtr(Customer_BirthDate)=2 then Promo='Spring';
else if qtr(Customer_BirthDate)=3 then Promo='Summer';
else if qtr(Customer_BirthDate)=4 then Promo='Fall';
if Customer_Age>=18 and Customer_Age<=25 then Promo2='YA';
else if Customer_Age>=65 then Promo2='Senior';
keep Customer_FirstName Customer_LastName Customer_BirthDate Customer_Age Promo Promo2;
run;
proc print data=work.season;
run;
/*7*/data work.ordertype;
set orion.orders;
DayOfWeek=weekday(Order_Date);
if Order_Type=1 then Type='Retail Sale';
else if Order_Type=2 then do;
Type='Catalog Sale';SaleAds='Mail';
end;
else if Order_Type=3 then do;
Type='Internet Sale'; SaleAds='Email';
end;
drop Order_Type Employee_ID Customer_ID;
run;
proc print data=work.ordertype;
run;

/*Chapter 10.1 level2*/
/*3ab*/proc contents data=orion.charities;
run;
proc contents data=orion.us_suppliers;
run;
proc contents data=orion.consultants;
run;
data work.contacts;	
	set orion.charities orion.us_suppliers;
run;
proc contents data=work.contacts;
run;
/*3c the first data set named orion.charities; */
/*3d*/data work.contacts2;	
	set orion.us_suppliers orion.charities;
run;
proc contents data=work.contacts2;
run;
data work.contacts3;	
	set  orion.us_suppliers orion.consultants;
run;
/*3e The first data set named orion.us_suppliers. */
/*3f Because for the contact type, it has two definitions which are character 
  and numeric. */

/*Chapter 10.3 level2*/
proc sort data=orion.product_list
out=work.product_list;
by Product_Level;
run;
data work.listlevel;
merge orion.product_level work.product_list;
by Product_Level;
keep Product_ID Product_Name Product_Level Product_Level_Name;
run;
proc print data=work.listlevel noobs;
where Product_Level=3;
run;

/*Chapter 10.4 level2*/
proc sort data=orion.customer
out=work.customer;
by Country;
run;
data work.allcustomer;
merge work.customer (in=Cust) 
orion.lookup_country(rename=(Start=Country 
Label=Country_Name) in=Ctry);
by Country;
keep Customer_ID Country Customer_Name Country_Name;
run;
proc print data=work.allcustomer;
run;


