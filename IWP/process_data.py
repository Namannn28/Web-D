import xml.etree.ElementTree as ET

# Parse the XML file
tree = ET.parse('IWP\personnel.xml')
root = tree.getroot()

# Find and print all employee names
print("All employee names:")
for name_element in root.iter('name'):
    print(name_element.text)

# Find and print employees in the "sales" department
print("\nEmployees in the sales department:")
sales_dept = root.find("./department[@id='sales']")
if sales_dept:
    for employee in sales_dept.iter('employee'):
        name = employee.find('name')
        title = employee.find('title')
        print(f"Name: {name.text}, Title: {title.text}")