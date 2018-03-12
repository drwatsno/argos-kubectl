#!/usr/bin/env bash

echo "kubectl"
echo "---"

PODS=$(kubectl get pods | awk 'BEGIN { ORS="" };{
if ($1 != "NAME") {
 print "-- " $1 " " $2 " " $3 " | bash=\"kubectl exec -it " $1 " sh\" | font=monospace"

 if ($3 == "Running") {
  print " | color=green"
 } else {
  print " | color=red"
 }
 print "\n"
}
}')

SERVICES=$(kubectl get services | awk 'BEGIN { ORS="" };{
if ($1 != "NAME") {
 print "-- " $1 " " $2 " " $3 " " $5 " | font=monospace bash=kubectl"
 print "\n"
}
}')


echo Pods
echo "$PODS"

echo Services
echo "$SERVICES"
