--- MYSQL FUNCTIONS

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