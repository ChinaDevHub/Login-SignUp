import random

ikiqat_eded = lambda a : a*2
print(ikiqat_eded(3))


list_1 = [1,-4,7,9,-9,17,-38]
new_list = list(map(lambda x : x*3,list_1))
print(new_list)

new_list_2 = list(filter(lambda a: a>8, list_1))
print(new_list_2)


list_2 = ["Cingiz","Eli","Semender", "", "MuradAli"]
new_list_3 = sorted(list_2 , key = lambda x : len(x))
print(new_list_3)


checking = lambda s : "Musbetdir" if s>0 else ("Menfidir" if s<0 else "Vahide beraberdir")
print(checking(3))
