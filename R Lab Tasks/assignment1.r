#1B Create a function to calculate the average, median and mean for a numeric vector age in employee database


emp=function(x)
{
  
  avg=sum(x)/length(x)
  print("Avg is:")
  print(avg)
  nmean=mean(x)
  print("Mean is:")
  print(nmean)
  
  nmedian=median(x)
  print("Median is:")
  print(nmedian)
  
}
install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='', dbname='r', host='localhost')
mydb
dbListTables(mydb)
dbListFields(mydb, 'r')
x = dbSendQuery(mydb, "select age from r")
x
data = fetch(x, n=-1)
data
emp(data$age)
data

#2B Create a data frame that stores the name, age, designation of the employee. Find how many employees are working in each designation?


Name=c('varma','chitra','rizwan','charan','kalyan','Rakesh','sai')
Age=c(18,19,21,23,24,18,20)
Designation=c("SDE-1","Manager","SDE-2","CEO","Team Leader","SDE-1","SDE-1")
UniqueDes = Designation[!duplicated(Designation)]
UniqueDes
Employees = data.frame(Name,Age,Designation)             
Employees
des = c()
no = c()
count=0
for(i in 1:length(UniqueDes)) { 
  for(j in 1:length(Designation)){
    if(UniqueDes[i]==Designation[j]){
      count = count+1
    }
  }
  des = append(des,UniqueDes[i])
  no = append(no,count)
  count = 0
}
des
no
countEmpolyees = data.frame("Designation"=UniqueDes,"Count"=no)
countEmpolyees

#3b Create two vectors that stores the details of name and gender of the employees. Find how many male and female employees are present


Name=c('sai','varma','chitra','rizwan','charan','kalyan')
Gender=c("M","M","F","M","M","M")
UniqueGen = Gender[!duplicated(Gender)]
UniqueGen
theDF = data.frame(Name,Gender)
theDF
no = c()
count=0
for(i in 1:length(UniqueGen)) { 
  for(j in 1:length(Gender)){
    if(UniqueGen[i]==Gender[j]){
      count = count+1
    }
  }
  no = append(no,count)
  count = 0
}
no
theDF2 = data.frame(UniqueGen,no)
theDF2


#4c 
#Write R code to define the function by using if-else
#F(x) =x 	    if x<1/2
#     =(1-x)	if ½<x<1
#     =0 	    otherwise


f=function(x)
{
  if(x<(1/2)){
    print(x)
  }
  else if((1/2)<x && x<1 ){
    print(1-x)
  }
  else{
    print(0)
  }
  
}
x=1.6
f(x)
