--- 😄 MYSQL STRING FUNCTIONS

--- ASCII FUNCTIONS => returns the ASCII value for the specific character
-- American standart code for information

SELECT ASCII(first_name) AS NumberCodeOfFirstChar
FROM employees

--- CHAR_LENGTH FUNCTION
--- CHAR_LENGTH(string), we can use directly a string or column name which comes from a table

SELECT CHAR_LENGTH('Gulcan') AS 'Length of the string'

select first_name, CHAR_LENGTH(first_name) AS 'Length First Name' FROM employees

--- CHARACTER_LENGTH FUNCTION
--- It is the same with CHAR_LENGTH

SELECT CHARACTER_LENGTH('123456') AS 'Length of the string'

SELECT last_name, CHARACTER_LENGTH(last_name) AS char_length from employees

--- CONCAT FUNCTION 

SELECT CONCAT(first_name, ' ', last_name) AS NAME FROM employees

--- CONCAT_WS
--- It is the same with CONCAT() function, but here we have to put the separater at the beginning and for separation we use double or single qoute

SELECT CONCAT_WS(' ', first_name, last_name) AS NAME from employees

SELECT CONCAT_WS(" - ", first_name, last_name) AS NAME from employees

--- FIELD FUNCTION => shows the first index position of a value. If we have two same values in the list, it will select the first position
--- FIELD(value, val1, val2, val3) => Case insensitive
--- FIELD(5, 1, 2, 3) => Here the value is 5, in the list we don't have 5 so the the result is 0


--- In this example we have two A at first and fourth positions but it will show us first porition  => 1
--- If I delete the first A, it will show the third position. 
SELECT FIELD("A", "a", "B", "C", "A", "D")

SELECT FIELD("A", "B", "C", "A", "D")

--- FIND_IN_SET FUNCTION => it returns the position of a string within a list of strings, if it does not find, the result is 0. 
--- FIND_IN_SET(string, string_list) => it is incase sensitive

--- here a is value and the others are set of strings
SELECT FIND_IN_SET("a", "d,v,b,n,a")

SELECT FIND_IN_SET("a", "O, S, F")

--- MYSQL FORMAT FUNCTION => formats the number
--- FORMAT(number, decimal_places) 
--- FORMAT(250500.5634, 0) => 250,500 | FORMAT(250500.5634, 1) => 250,500.6 | FORMAT(250500.5634, 3) => 250,500.563

--- INSERT FUNCTION => Inserts a string within a string at the specified position and for certain number of characters
--- INSERT(string, position, number, string2)

--- Bu ornekte ben COSKUN'u tamamen koyacagim. Eger positionu 1, number 0 secersem, Gulcan'in onune ikinci leimeyi koycak ve Gulcan'dan harf eksilmeyeck cunku number 0. 
--- COSKUNGulcan
SELECT INSERT('Gulcan', 1, 0, 'COSKUN')

--- Eger positionu 1, number 1 secersem, position hala 0, Gulcanin basindan 1 harf eksileteck => COSKUNulcan
SELECT INSERT('Gulcan', 1, 1, 'COSKUN')

--- Position 1, number 2. 2 harf eksilecek Gulcanin basindan => COSKUNlcan

SELECT INSERT('Gulcan', 1, 2, 'COSKUN')

--- Position 2, number 0 => GCOSKUNulcan

SELECT INSERT('Gulcan', 2, 0, 'COSKUN')

--- Position 2, number 1 => G yi alacak COSKUN koyacak sonraki 1 harfi silecek => GCOSKUNlcan
SELECT INSERT('Gulcan', 2, 1, 'COSKUN')

--- Position 2, number 4 =>G yi alacak sonraki 4 harfi silecek GCOSKUNn

SELECT INSERT('Gulcan', 2, 4, 'COSKUN')

--- Position 3, number 0 => GuCOSKUNlcan

SELECT INSERT('Gulcan', 3, 0, 'COSKUN')

--- Position 3, number 6 => GuCOSKUN

SELECT INSERT('Gulcan', 3, 6, 'COSKUN')

--- Position 6, number0 => GulcaCOSKUNn

SELECT INSERT('Gulcan', 6, 0, 'COSKUN')

--- INSTR FUNCTION => returns the position of the first occurence of a string in another string => Case insensitive. 
--- We are counting from 1, G 1, u 2, l 3
--- INSTR(string1, string2)

SELECT INSTR("Gulcan", 'can')

SELECT INSTR("Gulcan", 'ca')

SELECT INSTR("Gulcan", 'ul')

SELECT INSTR("Gulcan", 'n')

SELECT first_name, INSTR(first_name, "an") FROM employees

--- FUNCTION LCASE => lower case

SELECT CONCAT(first_name, ' ', last_name) AS NAME, LCASE(CONCAT(first_name, ' ', last_name)) AS 'lower case' FROM employees

--- LEFT FUNCTION extracts a number of characters from a string by starting from left and returns this

SELECT LEFT('Gulcan', 2) AS extract_string

SELECT LEFT('Gulcan COSKUN', 8) AS "EXTRACTING STRING" 

--- Find current date and take the year
SELECT CURDATE()

SELECT LEFT(CURDATE(), 4)

--- LENGTH => returns the length of a string in bytes

--- LENGTH(string)

SELECT first_name, LENGTH(first_name) AS "string length" from employees

--- LOCATE() FUNCTION => returns the position of the first occurence of a substring in a string.
--- If the substring is not found within the original string, the function returns 0. Case-insensitive
--- It is equal to POSITION() function
--- LOCATE(substring, string, start) => start is optional

SELECT LOCATE("can", "GulcanCoskun", 1)

SELECT first_name, LOCATE("a", first_name) AS LOCATE FROM employees

--- LOWER() FUNCTION => converts a string to lower-case
--- LCASE() is equal to LOWER()
--- LOWER(string)

SELECT CONCAT(first_name, ' ', last_name) AS NAME, LOWER(CONCAT(first_name, ' ', last_name)) AS 'LOWER CASE' FROM employees

--- LPAD() FUNCTION => Left-pad a string with another string, to a certain length
--- If the length of the string is larger than the length parameter, this function removes the overfloating characters from string
--- LPAD(string, length, lpad) => all required

--- here the length is smaller than the length of the original string. So it does not add X to the left of the original string but it takes just two letter from left. 
SELECT LPAD('Gulcan', 2, 'X')

--- here also the length is smaller than the length of the original string. So it does not add X to the left of the original string but it takes just 4 letter from left of the original string. 
SELECT LPAD('Gulcan', 4, 'X')

--- here the length of the original string is smaller than the length; So total length is 8 and original string's length is 6, so it will add 2 X to the left of thge original string
SELECT LPAD('Gulcan', 8, 'X')

--- here total length is 12, Gulcan is 6 length so it will add 6 X to the left to complete to 12
SELECT LPAD('Gulcan', 12, 'X')

--- total 15 characters
SELECT first_name, LPAD(first_name, 15, 'X') AS LPAD FROM employees

--- LTRIM() FUNCTION => Left trim, This removes leading spaces from a string, from the left, not between spaces
--- LTRIM(string)

SELECT LTRIM("   Gulcan    COSKUN") AS 'LTRIM()'

--- MID() => extracts a substring from a string by starting at any position
--- It equals to SUBSTR() and SUBSTRING() functions
--- MID(string, start, length) => string => to extract from, start => start position it starts from 1 not zero, length => the number of characters to extract from

--- Here start from 1 and extract 2 letters and return it
SELECT MID('Gulcan', 1, 2 ) 'MID() FUNCTION'

--- start from position 3 and extract 7 letters, if the original string length is smaller than 7, start from position 3 and extract the rest, maybe it is smaller than 7
--- position starts from 1 not zero
SELECT first_name AS NAME, MID(first_name, 3, 7) AS 'MID() FUNCTION' FROM employees

--- if we use negatif values it means start from reverse. For example, Gulcan, 1 is G, -1 is n, 2 is u, -2 is a

--- here extract 1 character and it is the character 2. character from reverse
SELECT first_name AS NAME, MID(first_name, -2, 1) AS 'MID() FUNCTION' FROM employees

SELECT MID('GULCAN', -3, 3) AS "MID()"

--- POSITION() FUNCTION = > It is the same with LOCATE() FUNCTION
--- POSITION(substring IN string)
--- Case-insensitive, returns the position of the first occurence of a substring in a string, starts from 1, Gulcan => G is 1 

SELECT POSITION('A' IN 'GULCAN') AS 'POSITION()'

SELECT first_name as NAME, POSITION('AN' IN first_name) AS 'POSITION()' FROM employees

--- REPEAT() => It repeats a string as many times as specified
--- REPEAT(string, number) => the string to repeat, the number of times to repeat the string

SELECT REPEAT('GULCAN | ', 3) AS 'REPEAT()'

SELECT employee_id, REPEAT(CONCAT(employee_id, ' '), 3) AS 'REPEAT()' FROM employees

--- REPLACE() FUNCTION => replaces all occurences of a substring within a string, with a new string => CASE SENSITIVE
--- REPLACE(string, substring, new_string)

--- replace first a letter with QQQ
SELECT first_name, REPLACE(first_name, 'a', 'QQQ') AS 'REPLACE' FROM employees

--- REVERSE() FUNCTION => reverses a string and returns the result
--- REVERSE(string)

SELECT first_name, REVERSE(first_name) AS 'REVERSE()' FROM employees

--- RIGHT() FUNCTION => extracts a number of characters from a string, starting from right
--- RIGHT(string, number_of_char), we can not use negatif numbers

SELECT RIGHT('Gulcan', 2) AS 'RIGHT()'

SELECT CURRENT_DATE(), RIGHT(CURRENT_DATE(), 4)

SELECT first_name, RIGHT(first_name, 5) AS 'RIGHT()' FROM employees

--- RPAD() FUNCTION => right pads a string with another string to a certain length
--- RPAD(string, length, rpad_string)

--- Here the length is 3, and the length of the original string is greater than 3 so it extracts just four letters from beginning and returns it
--- Total length of the new string should be 4, so it does not add Q to the right
SELECT RPAD('Gulcan', 4, 'Q') AS 'RPAD()'

--- here the total length of the new string is 10, Gulcan is 6 so it will add 4 Q to the right
SELECT RPAD('Gulcan', 10, 'Q') AS 'RPAD()'

--- RTRIM() FUNCTION => remove trailing spaces from a string (sondaki bosluklar)
--- It removes the spaces from right not from left and between

SELECT RTRIM('        GULCAN  ALADAG   ') AS 'RTRIM()'

--- SPACE() FUNCTION => return a string with 10 space characters
--- SPACE(number)

SELECT SPACE(4)

--- STRCMP() FUNCTION => it compares ASCII values of two strings
--- STRCMP(string1, string2)
--- If ASCII values of string1 = string2, the function returns 0  | if string1 < string2, the function returns -1  | if string1 > string2, the function returns 1

SELECT first_name, last_name, ASCII(first_name), ASCII(last_name) FROM employees

SELECT first_name, last_name, STRCMP(first_name, last_name) AS 'STRCMP()' FROM employees

--- SUBSTR() FUNCTION => extract a substring from astring
--- SUBSTR(string, start, length) => required, required, optional

--- If we do not use length parameter, it extract at position 2 and all values from right
SELECT SUBSTR('Gulcan', 2)

--- If we use length parameter, it extracts until this length value

SELECT SUBSTR('Gulcan', 2, 2)

--- here if you choose the position -1, it will extract just last one, because it extrcts from right, here kength is not important
SELECT SUBSTR('Gulcan', -1, 3)

SELECT SUBSTR('Gulcan Aladag', -5, 4)

--- SUBSTRING() FUNCTION is equal to SUBSTR() and MID() functions
--- SUBSTRING(string, start, length)

SELECT CONCAT(first_name, ' ', last_name), SUBSTRING(CONCAT(first_name, ' ', last_name), 3, 3) AS 'SUBSTRING()' FROM employees

SELECT CONCAT(first_name, ' ', last_name), SUBSTRING(CONCAT(first_name, ' ', last_name), -3, 3) AS 'SUBSTRING()' FROM employees

SELECT CONCAT(first_name, ' ', last_name), SUBSTRING(CONCAT(first_name, ' ', last_name), -1, 3) AS 'SUBSTRING()' FROM employees

--- SUBSTRING_INDEX() returns a substring of a string before a specified number of delimiter occurs
--- SUBSTRING_INDEX(string, delimiter, number)

--- here my delimiter is '.', so I will limit my string at position one that the first '.' appears =>>> result www
SELECT SUBSTRING_INDEX('www.gmail.com', '.' , 1)

--- result is www.gmail
SELECT SUBSTRING_INDEX('www.gmail.com', '.' , 2)

--- result www.gmail.
SELECT SUBSTRING_INDEX('www.gmail.com', 'c' , 1)

--- TRIM() FUNCTION => removes leading and trailing spaces from a string => bastaki ve sondaki bosluklar
--- TRIM(string) => it removes only leading and trailing spaces not between 

SELECT TRIM('    Gulcan     ALADAG   COSKUN   ') AS 'TRIM()'

--- UCASE() FUNCTION => convert the text to upper case => It equals to UPPER() function
--- UCASE(text)

SELECT department_name, UCASE(department_name) AS 'UCASE()' FROM departements

--- UPPER() FUNCTION => convert the text to upper case it is equal to UCASE()

SELECT * from countries

SELECT country_name, UPPER(country_name) AS 'UPPER()' FROM countries

--- 😄 MYSQL STRING FUNCTIONS

--- ABS() FUNCTIONS => returns the absolute(positive) value of a number
--- ABS(number)

SELECT ABS(-1) AND 

--- AVG() FUNCTION => returns the average value of an expression

SELECT department_id, AVG(salary) AS AVG_SALARY FROM employees GROUP BY department_id

--- CEIL() FUNCTION => return the smallest integer value that is bigger than or equal to a number
--- It equals to CEILING() FUNCTION

SELECT CEIL(-1.453) AS 'CEIL()'

SELECT CEIL(-2.653) AS 'CEIL()'

--- CEILING() FUNCTION => return the smallest integer value that is bigger than or equal to a number
--- It equals to CEIL() FUNCTION

SELECT CEILING(-8.853) AS 'CEILING()'

SELECT CEILING(-2.653) AS 'CEILING()'

--- COUNT() FUNCTIONS => returns the number of records returned by a selected query
--- NULL values are not counted
--- COUNT(expression)

SELECT COUNT(employee_id) AS COUNT from employees

--- DIV() FUNCTION => it is for integer division
--- SELECT x DIV y => x the value that will be divided, y is divisor
--- Even if the result is decimal like 12/5 = 2.6, it will return an integer => 2

SELECT 12 DIV 5 AS DIV_INTEGER

--- FLOOR() FUNCTION => It is reverse of the CEIL() and CEILING() => but it returns the largest integer that is smaller than or equal to number
--- For CEIL() and CEILING(), if the number of decimal part greater than 5 or less than 5, it selecets always the smallest number like 8.654 or 8.234 => both result 8


--- For FLOOR() the decimal part is greater than 5 or less than 5, it will select amways gretaer number of integer part
---  8.854, 8.123, 8.555 => result is always 9

SELECT FLOOR(-8.853) AS 'FLOOR()'

SELECT FLOOR(-2.453) AS 'FLOOR()'

--- GREATEST() FUNCTION => returns the greatest value of the list of arguments
--- GREATEST(arg1, agr2, arg3, ...)
--- We can use it also for string, it choose the greatest one according to ASCII value

SELECT GREATEST(2.34, 4.12, 5, 1.12)

SELECT GREATEST('Gulcan', 'Aladag', 'Coskun', 'Sedat', 'Vedat', 'Bircan')

SELECT ASCII('Gulcan'), ASCII('Aladag'), ASCII('Coskun'), ASCII('Sedat'), ASCII('Vedat'), ASCII('Bircan')

--- LEAST() FUNCTION => returns the smallest value of the list of the arguments
--- It is reverse to GREATEST(), it turns the smallest ASCII value of the string
--- LEAST(arg1, arg2, arg3, ...)

SELECT LEAST(1.23, 3.45, 6.56, 1, -9)

--- ASCII respectively => 71, 65, 67, 83, 86, 66
SELECT ASCII('Gulcan'), ASCII('Aladag'), ASCII('Coskun'), ASCII('Sedat'), ASCII('Vedat'), ASCII('Bircan')

SELECT LEAST('Gulcan', 'Aladag', 'Coskun', 'Sedat', 'Vedat', 'Bircan')

--- MAX() FUNCTION => returns the max value of a set

SELECT salary, (SELECT MAX(salary)  FROM employees) AS max_salary FROM employees order by salary DESC

--- MIN() FUNCTION => returns the min value of a set

SELECT salary, (SELECT MIN(salary)  FROM employees) AS max_salary FROM employees order by salary DESC

--- MOD() FUNCTION => returns the remainder of a number divided by another number
--- MOD(18, 4) => 18/4 = 4 => remainder => 18-16 =2

SELECT MOD(18, 4)

--- POW() FUNCTION = POWER() FUNCTION returns the value of a number raised to the power of another number
--- It equals to the POWER() FUNCTION
--- POW(4, 2) => 4*4 => 4 is the base, 2 is the exponent

SELECT POW(4, 2)

SELECT POWER(4, 3)

--- RAND() FUNCTION => returns a decimal random number >= 0 and <1

SELECT RAND()

--- ROUND() FUNCTION => rounds a number to a specified number of decimal places
--- ROUND(number, decimals) 

SELECT ROUND(342.6895, 2)

--- SIGN() FUNCTION => returns the sign of the number, if the number > 0 => +1, < 0 => -1, = 0 => 0

SELECT SIGN(-5) 

SELECT SIGN(6)

SELECT SIGN(0)

--- SQRT() FUNCTION => returns the square root of the number 

-- 64 => 8, 27 => 5.2
SELECT SQRT(64)

SELECT SQRT(27)

--- SUM() FUNCTION => calculates the sum of a set of values


SELECT salary, (SELECT SUM(salary) from employees ) as 'SUM()' from employees

--- TRUNCATE() FUNCTION it truncate a number to specified number of decimal placaes
--- TRUNCATE(number, decimal)

SELECT TRUNCATE(1234.786, 2)

--- 😄 MYSQL DATE FUNCTIONS

--- ADDDATE() FUNCTION = DATE_ADD() FUNTION => adds a time/date interval to a date and then returns the date
--- ADDDATE(date, INTERVAL, value addunit) OR ADDDATE(date, days)
--- ADDUNKIT => the type of interval => second, minute, hour, day, week, year


--- DATE_ADD() FUNCTION => add a time/date interval to a date and then returns the date
--- DATE_ADD(date, INTERVAL value addunit)

SELECT first_name, hire_date from employees

SELECT ADDDATE(hire_date, INTERVAL 15 minute) as 'ADDDATE()' FROM employees

SELECT hire_date, ADDDATE(hire_date, INTERVAL 15 day) as 'ADDDATE()' FROM employees

SELECT hire_date, ADDDATE(hire_date, INTERVAL 2 year) as 'ADDDATE()' FROM employees

SELECT hire_date, ADDDATE(hire_date, INTERVAL -2 hour) as 'ADDDATE()' FROM employees

SELECT hire_date, ADDDATE(hire_date, INTERVAL -2 month) as 'ADDDATE()' FROM employees

SELECT  hire_date, DATE_ADD(hire_date, INTERVAL 15 minute) as 'DATE_ADD()' FROM employees

SELECT hire_date, DATE_ADD(hire_date, INTERVAL 15 day) as 'DATE_ADD()' FROM employees

SELECT hire_date, DATE_ADD(hire_date, INTERVAL 2 year) as 'DATE_ADD()' FROM employees

SELECT hire_date, DATE_ADD(hire_date, INTERVAL -2 hour) as 'DATE_ADD()' FROM employees

SELECT hire_date, DATE_ADD(hire_date, INTERVAL -2 month) as 'DATE_ADD()' FROM employees

--- ADDTIME() FUNCTION => adds time or datetime and return it

--- add 2 hours, 10 minutes, 5 second and 3 microseconds => 2:10:5:3 => hour:minute:second

SELECT hire_date, ADDTIME(hire_date, '2:10:5:3') as 'ADDTIME()' FROM employees

--- add 2 day and  2 hours, 10 minutes, 5 second and 3 microseconds => 2:10:5:3 => hour:minute:second

SELECT hire_date, ADDTIME(hire_date, '2 2:10:5:3') as 'ADDTIME()' FROM employees

--- CURDATE() FUNCTION = CURRENT_DATE() FUNCTION returns the current date
--- the date returned as string "YYYY-MM-DD" or numric YYYYMMDD

--- result is string
SELECT CURDATE()

--- add one day and it returns numeric
SELECT CURDATE() + 1

--- the result is string
SELECT CURRENT_DATE()

--- add one day the result is numeric
SELECT CURRENT_DATE() + 1

--- CURRENT_TIME() FUNCTION = CURTIME() FUNCTION => it returns time as string 'HH-MM-SS' or as numeric HHMMSS

--- result is string 16:25:33
SELECT curtime()

--- result is numeric 162624
SELECT curtime() + 1

--- result is string 16:25:33
SELECT current_time()

--- result is numeric 162624
SELECT current_time() + 1

--- CURRENT_TIMESTAMP() => returns date and time as string "YYYY-MM-DD HH:MM:SS" or as numeric YYYYMMDDHHMMSS

--- result is string 2024-06-26 16:25:33
SELECT CURRENT_TIMESTAMP()

--- result is numeric 20240626162624
SELECT CURRENT_TIMESTAMP() + 1

--- DATE() FUNCTION => extracts the date part from a date timestamp

SELECT DATE(CURRENT_TIMESTAMP) AS 'DATE()'

--- DATEDIFF() FUNCTION => returns the number of days between two date values 
--- DATEDIFF(date1, date2)

SELECT first_name, hire_date from employees

SELECT DATEDIFF((select hire_date  from employees where first_name = 'Stevennn'), (select hire_date from employees where first_name = 'Neena'))

--- DATE_FORMAT() FUNCTION => formats a date as specified
--- DATE_FORMAT(date, format)
--- For example => 

--- %H hour (00 to 23)
--- %h hour (00 to 12)
--- %i minutes (00 to 59)
--- %p (AM or PM)

SELECT DATE_FORMAT(CURRENT_TIMESTAMP, "%H %h %i %p")

--- DATE_FORMAT for months 

--- %b(from Jan to Dec)
--- %c(numeric months from 0 to 12)
--- %M (month names full january, february, ...)

SELECT DATE_FORMAT(CURRENT_TIMESTAMP, "%b %M %c")

--- DATE_FORMAT for days 

--- %a (from sun to sat)
--- %D (days numeric, 1st, 2nd, ...)
--- %d (days numeric 01, 11, 12)
--- %e (day of the month as numeric 0, 1, 2, 31)
--- %W weekday full Sunday to Saturday
--- %w day of the week Sunday = 0, Saturday = 6

SELECT DATE_FORMAT(CURRENT_TIMESTAMP, "%a %D %e %d %W %w")

--- %Y year as a numeric, 4 digit 
--- %y year as a numeric, 2 digit

SELECT DATE_FORMAT(CURRENT_TIMESTAMP, "%Y %y")

Select hire_date, DATE_FORMAT(hire_date, '%W %M %Y') AS 'FORMAT_DATE()' FROM employees

--- DATE_SUB() FUNCTION subtracts a time/date interval from a date and then returns the date
--- DATE_SUB(date, INTERVAL value interval)

SELECT CURRENT_TIMESTAMP(), DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 10 minute)

--- If I use negatif value, it adds
SELECT CURRENT_TIMESTAMP(), DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL -10 minute)

--- here the time is not specified so it takes the time as 00:00:00
SELECT hire_date, DATE_SUB(hire_date, INTERVAL 10 minute) AS 'DATE_SUB()' FROM employees

SELECT hire_date, DATE_SUB(hire_date, INTERVAL 2 month) AS 'DATE_SUB()'  FROM employees

SELECT hire_date, DATE_SUB(hire_date, INTERVAL 2 year) AS 'DATE_SUB()'  FROM employees

--- DAY() FUNCTION = DAYOFMONTH() FUNCTION => return the day of the month for a date

SELECT hire_date, day(hire_date) AS 'DAY()' from employees

SELECT hire_date, DAYOFMONTH(hire_date) AS 'DAY()' from employees

--- DAYNAME() FUNCTION => returns the weekday name for a given date 

SELECT hire_date, DAYNAME(hire_date) AS 'DAYNAME()'  FROM employees

--- DAYOFWEEK() FUNCTION => returns the weekday index for a given date 
--- 1= Sunday, 7=Saturday
--- DAYOFWEEK(date)

--- DAYOFYEAR() FUNCTION => returns the year for a given date 
--- from 1 to 366
--- DAYOFYEAR(date)

SELECT hire_date, DAYOFWEEK(hire_date) AS 'DAYOFWEEK()', DAYNAME(hire_date) AS 'DAYNAME()', DAYOFYEAR(hire_date) AS 'DAYOFYEAR' from employees

--- EXTRACT() FUNCTION => it extracts a part from a given date 
--- EXTRACT(part FROM date) 
--- Tu peux extracter the part like WEEK, MINUTE, YEAR_MONTH

SELECT hire_date, EXTRACT(WEEK FROM hire_date) AS 'EXTRACT' from employees

SELECT hire_date, EXTRACT(YEAR FROM hire_date) AS 'EXTRACT' from employees

SELECT hire_date, EXTRACT(DAY FROM hire_date) AS 'EXTRACT' from employees

SELECT hire_date, EXTRACT(YEAR_MONTH FROM hire_date) AS 'EXTRACT' from employees

SELECT hire_date, EXTRACT(day_hour FROM hire_date) AS 'EXTRACT' from employees

--- FROM_DAYS() FUNCTION => returns a date from a numeric date value

--- Then return date from a numeric representation of the day

SELECT FROM_DAYS(699969) 

--- HOUR() FUNCTION => returns the hour part for a given date

--- HOUR(datetime) 

SELECT CURRENT_TIMESTAMP(), HOUR(CURRENT_TIMESTAMP())

--- LAST_DAY() FUNCTION => extract the last day of the month for a date

SELECT (CURRENT_TIMESTAMP) AS 'Cur_date', LAST_DAY(CURRENT_TIMESTAMP) AS 'last_day'

--- LOCALTIME() FUNCTION => it returns the current date and time

--- LOCALTIME() => string

SELECT LOCALTIME() AS 'Local time string'

--- LOCALTIME() => numeric

SELECT LOCALTIME() + 0 AS 'Local time numeric'

--- LOCALTIMESTAMP() => returns the current date and time

--- LOCALTIMESTAMP() string
SELECT LOCALTIMESTAMP()

--- LOCALTIMESTAMP() numeric
SELECT LOCALTIMESTAMP() + 0

--- MAKEDATE() FUNCTION => create and return a date based on a year and a number of days 
--- MAKEDATE(year, day)

SELECT MAKEDATE(2018, 203), MAKEDATE(2023, 45), MAKEDATE(2024, 654)

--- MAKETIME() FUNCTION => create and return a time value based on an hour, minute, and second
--- MAKETIME(hour, minute, second)

SELECT MAKETIME(16, 1, 56), MAKETIME(13, 45,43)

--- MICROSECOND() => returns the microsecond part of a time/datetime (from 0 to 999999)
--- MICROSECOND(datetime)

SELECT MICROSECOND('23:59:59.0004')

--- MINUTE() FUNCTION => return the minute part of a datetime
--- MINUTE(datetime)

SELECT MINUTE("2017-06-20 09:34:00")

--- MONTH() FUNCTION => return the month part of a date

SELECT MONTH("2017-06-20 09:34:00")

--- MONTHNAME() FUNCTION => return the name of the month for a date

SELECT MONTHNAME("2017-06-20 09:34:00")

--- NOW() FUNCTION => return current date and time

SELECT NOW() 

SELECT NOW() + 0

--- PERIOD_ADD() FUNCTION => adds a specified number of months to a period, it returns the result as YYYYMM
--- PERIOD_ADD(period, number) => period must be numeric YYMM or YYYYMM

SELECT PERIOD_ADD(198409, 1)

--- PERIOD_DIFF() FUNCTION => returns the difference between two periods, the result will be in months
--- PERIOD_DIFF(period1, period2) => Format must be YYMM *or YYYYMM
--- The result is month

SELECT PERIOD_DIFF(198409, 197709)

--- QUARTER() => returns the quarter of the year for a given date value (from 1 to 4)
--- QUARTER(date)
--- January-March => 1
--- April-June => 2
--- July-September => 3
--- October-December => 4

SELECT QUARTER(CURRENT_DATE), QUARTER(19840915)

--- SECOND() => returns the second part of a time/datetime (from 0 to 59)
--- SECOND/(datetime)

SELECT SECOND(CURRENT_TIMESTAMP()), SECOND(LOCALTIMESTAMP())

--- SEC_TO_TIME() FUNCTION returns a time value (HH:MM:SS)
--- SEC_TO_TIME(seconds) => the number of seconds

SELECT SEC_TO_TIME(-876), SEC_TO_TIME(876)

--- STR_TO_DATE() FUNCTION => returns a date based on a string and a format
--- STR_TO_DATE(string, format) 

SELECT STR_TO_DATE("September 15 1984", '%M %d %Y')

--- SUBDATE() FUNCTION => subtracts a time/date interval from a date and then returns the date
--- SUBDATE(date, INTERVAL value unit) =>
--- SUBDATE(date, days) => 

SELECT hire_date, SUBDATE(hire_date, INTERVAL 1 YEAR) AS SUBDATE, SUBDATE(hire_date, INTERVAL 2 MONTH) AS SUBDATE from employees

--- SUBTIME() FUNCTION => subtracts time from  time/datetime expression and then returns the new time/datetime
--- SUBTIME(datetime, time_interval) => time_interval can be pozitif or negatif values 

--- Substract 3 hours, 3 minutes, 3 seconds, here the time is not certain, so it substracts from 24:00:00   
SELECT hire_date, SUBTIME(hire_date, '3:3:3' ) AS 'SUBTIME()' FROM employees

---Substract 3 minutes from current date=> if I want to substract 3 minutes, write 300, for 30 minutes 3000

SELECT LOCALTIMESTAMP() AS 'CURRENT TIME', SUBTIME(LOCALTIMESTAMP(), '300') AS 'SUBTIME()'

--- Add 3 hours, 3 minutes, 3 seconds 

SELECT LOCALTIMESTAMP() AS 'CURRENT TIME', SUBTIME(LOCALTIMESTAMP(), '-3:3:3') AS 'SUBTIME()'

--- SYSDATE() FUNCTION => returns the current date and time 

--- string
SELECT SYSDATE() 

--- numeric
SELECT SYSDATE() + 0

--- TIME() FUNCTION => extracts time part from a given time/datetime 

SELECT LOCALTIMESTAMP, TIME(LOCALTIMESTAMP()),TIME(CURRENT_TIMESTAMP()), TIME(SYSDATE())

--- TIME_FORMAT() FUNCTION => formats a time by a specified format
--- TIME_FORMAT(time, format)


SELECT SYSDATE(), TIME_FORMAT(SYSDATE(), '%H %i %s %p')

--- TIME_TO_SEC() FUNCTION => converts a time value into seconds
--- TIME_TO_SEC(time) 

SELECT TIME_TO_SEC(LOCALTIMESTAMP()), TIME_TO_SEC(CURRENT_TIMESTAMP()), TIME_TO_SEC(SYSDATE())

--- TIMEDIFF() FUNCTION => returns the difference between two time/datetime expressions
--- TIMEDIFF(time1, time2)

--- year month day hour minute second
SELECT TIMEDIFF(LOCALTIMESTAMP(), '1984-09-15 23:59:59')

--- TIMESTAMP() FUNCTION => returns a datetime value based on a date or datetime value
--- TIMESTAMP(expression, time)

SELECT TIMESTAMP(CURRENT_DATE)

--- TO_DAYS() FUNCTION => returns the number of days between a date and year 0
--- TO_DAYS(date) 

SELECT TO_DAYS(CURRENT_TIMESTAMP()), TO_DAYS('1984-09-15'), TO_DAYS('2016-02-16')

--- WEEK() FUNCTION => Return the week number for a date 

--- It returns weeks in that year
SELECT WEEK(CURRENT_TIMESTAMP()), WEEK('1984-09-15'), WEEK('2023-01-10')

--- WEEKDAY() FUNCTION => returns the weekday number for a given date
--- 0 = Monday, 1 = Tuesday, ...
--- WEEKDAY(date)
--- Sedat Sali, Vedat carsamba, ben cumartesi

SELECT WEEKDAY(LOCALTIMESTAMP), WEEKDAY('2016-02-16'), WEEKDAY('2018-12-05'), WEEKDAY('1984-09-15')

--- WEEKOFYEAR() FUNCTION => returns the week number for a given date => from 0 to 53
--- WEEKOFYEAR(date)

SELECT WEEKOFYEAR('1984-09-15'), WEEKOFYEAR('2016-02-16'), WEEKOFYEAR('2018-12-05')

--- YEAR() FUNCTION => returns the year part of a given date
--- YEAR(date)

SELECT YEAR('1984-09-15'), YEAR('2016-02-16'), YEAR('2018-12-05')

--- YEARWEEK() FUNCTION => returns the year and week number => from 0 to 53
--- YEARWEEK(date)

SELECT YEARWEEK('1984-09-15'), YEARWEEK('2016-02-16'), YEARWEEK('2018-12-05')

--- 😄 MYSQL ADVANCE FUNCTIONS

--- CASE FUNCTION

--- CASE
--- WHEN condition1 THEN result1
--- WHEN condition2 THEN result2
--- WHEN condition3 THEN result3
--- ELSE result
--- END

SELECT employee_id, CONCAT(first_name, ' ', last_name), 
CASE 
WHEN first_name LIKE 'A%' THEN "First name is AAAAA"
WHEN first_name LIKE 'B%' THEN "First name is BBBBB"
WHEN first_name LIKE 'S%' THEN "First name is SSSSS"
ELSE "First name is XXXXX"
END
FROM employees

--- CAST FUNCTION => converts a value into the specified datatype
--- CAST(value AS datatype) => value is to convert, datatype , DATE, DECIMAL, CHAR, TIME

SELECT CAST("Gulcan" AS NCHAR), CAST("19840915" AS DATE), CAST("12,34" AS DECIMAL), CAST("234545" AS TIME)

--- COALESCE() FUNCTION => returns the first non-null value in a list 

SELECT manager_id, COALESCE(manager_id) from employees

--- CONVERT() FUNCTION => converts a value into the specified datatype or character set
--- CONVERT(value, type) 
--- CONVERT(value USING charset)

SELECT hire_date, CONVERT(hire_date, DATETIME) from employees

--- CURRENT_USER() => returns the user name and host name for the MYSQL account

SELECT CURRENT_USER()

--- DATABASE() FUNCTION => returns the name of the current database

SELECT DATABASE()

--- IF() FUNCTION
--- IF(condition, value_if_true, value_if_false)

--- hire_date, asagidaki tarihten buyukse, hire_date al, degilse bir not dus
SELECT hire_date, IF(hire_date > "1996-12-30", hire_date, "Hire date is not correct!") from employees

--- ISNULL() FUNCTION => returns 1 or 0 depending on whether an expression is NULL
--- ISNULL(expression) => If expression is NULL returns 1, otherwise it returns 0

SELECT manager_id, ISNULL(manager_id) from employees

--- LAST_INSERT_ID() FUNCTIONS => returns the AUTO_INCREMENT id of the last row that has been inserted or update in a table
--- LAST_INSERT_ID()(expression)

SELECT employee_id, LAST_INSERT_ID(employee_id) FROM employees

--- NULLIF() FUNCTION => compares two expressions and returns NULL if they are equal, otherwise, the first expression is returned
--- NULLIF(exp1, exp2)

--- if max_salary is 9000, turn it NULL, if not, turn it the value
SELECT max_salary, min_salary, NULLIF(max_salary, 9000) from jobs

--- SESSION_USER(), SYSTEM_USER(), USER() => return the current user name and host name for the MYSQL connection

SELECT SESSION_USER()

SELECT SYSTEM_USER()

SELECT USER()

--- VERSION() => returns the current version of the MYSQL database, as a string

SELECT VERSION()

