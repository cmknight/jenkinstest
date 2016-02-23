This directory will contain files to be added to a shared library in the application server.  The library will be created using the ConfigEngine tasks.  Properties on which these tasks depend will be set in the file: componentN/shared/common/shared-library.properties, see example file for details.

To generate the name of the library, the following syntax will be used: <componentName> + 'Lib'.

For example: sample3Lib