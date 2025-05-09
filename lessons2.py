import random

# def check(x):
#     if x>3:
#         print("3-den boyukdur")
        

# print(check(4))

# check = lambda x: "3-den boyukdur" if x>3 else "None"
# print(check(6))

##<Map
##Filter
##Sorted 

# list_1 = [1,4,3,7,8]
# check = list(map(lambda x : x*3, list_1))
# print(check)


# list_1 = ["Ali", "Chingiz" , "", "Semender", "Aysel"]
# checking = list(sorted(list_1, key = lambda x : len(x)))
# print(checking)

# list_1 = [1,4,3,7,8]
# filter = list(filter(lambda s : s>3, list_1))
# print(filter)


# def isOdd(x):
#     if x%2==0:
#         print("Eded cutdur ")
#     else :
#         print("Eded tekdir")

# print(isOdd(17))

checking = lambda s : "eded cutdur" if s%2==0 else ("Eded tekdir" if s%2!=0 else "Eded vahide berabeerdir")
print(checking(0))
