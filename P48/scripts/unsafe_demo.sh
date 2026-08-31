#!/bin/bash
echo " Starting unsafe script..."
ls /nonexistent_directory_for_testing
echo "Variable value is : *UNSET_VARIABLE"
echo "Unsafe script finished executing despite errors!"
