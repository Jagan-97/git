#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateInMonth=100
empRatePerHr=20
numOfworkingDays=20

totalEmpHr=0
totalworkingDays=0

function getworkHours()
{
       case $randomCheck in
                              $isPartTime )
                                      empHrs=4
                              ;;
                              $isFullTime )
                                      empHrs=8
                              ;;
                              *)
                                      empHrs=0
                              ;;
      esac
}

function getEmpwage()
{
     echo $(($totalEmpHr*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxRateInMonth &&
         $totalworkingDays -lt $numOfworkingDays ]]
do
      ((totalworkingDays++))
      randomCheck=$((RANDOM%3))
      getworkHours $randomCheck
      totalEmpHr=$(($totalEmpHr+$empHrs))
      dailywages[$totalworkingDays]=$(($empHrs*$empRatePerHr))
done

totalSalary=$( getEmpwage $totalEmpHr )
echo $totalSalary
echo ${dailywages[@]}
echo ${!dailywages[@]}
echo ${#dailywages[@]}

