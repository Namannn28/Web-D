PL/SQL Answers
Here are the answers to your PL/SQL questions.

/*1. Calculate Employee Incentive
This PL/SQL block calculates an employee's incentive by fetching their salary and applying a 10% rate.
*/
SQL

SET SERVEROUTPUT ON;
DECLARE
    v_emp_id NUMBER := 110;
    v_salary NUMBER;
    v_incentive NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    v_incentive := v_salary * 0.10;

    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' incentive is: ' || v_incentive);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ' || v_emp_id || ' not found.');
END;
*/
/*2. Invalid Case-Insensitive Reference
In PL/SQL, unquoted identifiers are case-insensitive, but quoted identifiers are case-sensitive. The following block will fail because it tries to reference the quoted identifier "my_variable" using a different case ("My_Variable").*/

SQL

SET SERVEROUTPUT ON;
DECLARE
    my_variable NUMBER := 10;
    "my_variable" NUMBER := 20;
BEGIN
    -- This works because unquoted identifiers are case-insensitive
    DBMS_OUTPUT.PUT_LINE('Unquoted variable value: ' || MY_VARIABLE);

    -- This will cause an error because the quoted identifier is case-sensitive
    -- and must be referenced as "my_variable".
    -- The output below shows the expected error.
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Quoted variable value: ' || "My_Variable");
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END;
/
/*3. Reserved Word as a User-Defined Identifier
You can use a reserved word as an identifier by enclosing it in double quotation marks.*/

SQL

SET SERVEROUTPUT ON;
DECLARE
    "SELECT" VARCHAR2(50) := 'This is a reserved word identifier.';
BEGIN
    DBMS_OUTPUT.PUT_LINE("SELECT");
END;
/
/*4. Neglecting Double Quotes in a Reserved Word Identifier
If you declare a variable using a reserved word with double quotes, you must always reference it with those quotes. Neglecting them will result in a syntax error.*/

SQL

SET SERVEROUTPUT ON;
DECLARE
    "SELECT" VARCHAR2(50) := 'This is a reserved word identifier.';
BEGIN
    -- This will cause a compilation error.
    DBMS_OUTPUT.PUT_LINE(SELECT);
END;
/
/*5. Neglecting Case Sensitivity in a Quoted Identifier (Reserved Word)
Even if the identifier is a reserved word, its case must be respected if it's been quoted. Referencing it with the wrong case will cause an error.*/

SQL

SET SERVEROUTPUT ON;
DECLARE
    "begin" NUMBER := 100;
BEGIN
    -- This will cause a compilation error because it must be "begin", not "BEGIN".
    DBMS_OUTPUT.PUT_LINE("BEGIN");
END;
/
/*6. Arranging Two Numbers
This block uses an IF statement to compare two numbers and store them correctly in num_small and num_large.
*/

SQL

SET SERVEROUTPUT ON;
DECLARE
    v_num1      NUMBER := 50;
    v_num2      NUMBER := 20;
    num_small   NUMBER;
    num_large   NUMBER;
BEGIN
    IF v_num1 < v_num2 THEN
        num_small := v_num1;
        num_large := v_num2;
    ELSE
        num_small := v_num2;
        num_large := v_num1;
    END IF;

    DBMS_OUTPUT.PUT_LINE('The small number is: ' || num_small);
    DBMS_OUTPUT.PUT_LINE('The large number is: ' || num_large);
END;
/
jQuery Answers
/*7. What is $(document).ready()?
The $(document).ready() function is a core jQuery concept that ensures your JavaScript code runs only after the Document Object Model (DOM) is fully loaded and ready for manipulation. It's used to prevent errors that can happen when you try to access elements that haven't been created by the browser yet.*/

A more modern, shorthand syntax is $(function() { ... });.

Example:

JavaScript

$(document).ready(function() {
    // This code will only run after the DOM is ready.
    $('#my-div').text('DOM is ready!');
});
/*8. Difference Between $(document).ready() and $(window).load()
The key difference is what they wait for.*/

Feature	$(document).ready()	$(window).load()
When it fires	After the HTML structure (DOM) is fully loaded. It doesn't wait for external resources like images or iframes.	After the entire page, including all external resources, has finished loading.
Performance	Faster and more common for general DOM manipulation and event handling.	Slower, as it waits for everything. Best used for code that requires resource dimensions, like an image's size.

Export to Sheets
/*9. Attaching Events and Manipulating the DOM
This example shows how to attach a click event to a button and then manipulate the DOM by appending a new item to an unordered list.*/

HTML

<!DOCTYPE html>
<html>
<head>
    <title>jQuery Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <button id="add-item-btn">Add List Item</button>
    <ul id="my-list">
        <li>Initial Item</li>
    </ul>

    <script>
        $(document).ready(function() {
            // Attach a click event to the button
            $('#add-item-btn').on('click', function() {
                // Manipulate the DOM by appending a new list item
                $('#my-list').append('<li>New Item</li>');
            });
        });
    </script>
</body>
</html>
/*10. Efficiently Sorting Elements
To sort elements with minimal DOM interruption, you should detach the elements from the DOM, sort them in memory, and then re-append them all at once.*/

HTML

<!DOCTYPE html>
<html>
<head>
    <title>jQuery Sort Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <button id="sort-list-btn">Sort List (A-Z)</button>
    <ul id="sortable-list">
        <li>Banana</li>
        <li>Apple</li>
        <li>Cherry</li>
    </ul>

    <script>
        $(document).ready(function() {
            $('#sort-list-btn').on('click', function() {
                const $list = $('#sortable-list');
                const $items = $list.find('li');

                // Detach items from the DOM
                $items.detach();

                // Sort the detached items in memory
                const sortedItems = $items.sort(function(a, b) {
                    const textA = $(a).text().toUpperCase();
                    const textB = $(b).text().toUpperCase();
                    return (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
                });

                // Append all sorted items back to the list
                $list.append(sortedItems);
            });
        });
    </script>
</body>
</html>