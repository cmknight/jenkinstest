Sample3.paa

This paa file demonstrates how a paa file can be used to automatically configure a database 
connection  in WebSphere portal.  The datasource is created by solution installer based 
on a set of properties, and the database is populated with some table information from an sql script.

An SQL file called create_tables_derby.sql can be found in the
Sample3/components/Sample3/content/database/install directory.

To deploy  this paa file run the following commands:
1. ConfigEngine.bat<.sh> install-paa -DPAALocation=<path_to_Sample3.paa>
2. <IMPORTANT>Before running the deployment in step 3, make sure to change the property file at:
<profile_directory>/paa/Sample3/components/Sample3, edit Sample3.properties
Set values according to your environment. You can refer to a sample file default.properties which is under Sample3/components/Sample3/content/database/default.properties.

3. ConfigEngine.bat<.sh> deploy-paa -DappName=Sample3

To verify:
Log in to the WAS admin console, go to Resources, JDBC, Data source. You will see a datasource called sample3Datasource created.