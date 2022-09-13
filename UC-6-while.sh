#!/bin/bash -x

isPartTime=1
isFullTime=2
empRatePerHr=20
maxRateInMonth=100
numOfworkingDays=20

totalEmpHr=0
totalWorkingdays=0

while [[ $totalEmpHr -lt $maxRateInMonth && 
         $totalWorkingdays -lt $numOfworkingDays ]]
do
      ((totalWorkingdays++))
      randomCheck=$((RANDOM%3))
      case $randomCheck in
                           $isFullTime )
                                     empHrs=8
                           ;;
                           $isPartTime )
                                     empHrs=4
                           ;;
                           *)
                                     empHrs=0
                           ;;
      esac
   
     totalEmpHr=$(($totalEmpHr+$empHrs))
done

totalSalary=$(($totalEmpHr*$empRatePerHr))
