#!/bin/bash -x

isPartTime=1
isFullTime=2
empRatePerHr=20
maxRateInMonth=100
numOfworkingDays=20

totalEmpHr=0
totalWorkingdays=0

function getworkHours()
{
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
}
while [[ $totalEmpHr -lt $maxRateInMonth &&
         $totalWorkingdays -lt $numOfworkingDays ]]
do
        ((totaworkingDays++))
        randomCheck=$((RANDOM%3))
        getworkHours $randomCheck
        totalEmpHr=$((totalEmpHr+empHrs))
done

totalsalary=$(($totalEmpHr*$empRatePerHr))

