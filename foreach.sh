#!/bin/bash

for item in $($1)
do
	$2 $item
done
