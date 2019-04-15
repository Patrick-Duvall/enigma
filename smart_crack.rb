arr = [['08','35','63','89'],['02','29','56','83'],['03','30','57','84'],['04','31','58','85']]


arr_1 = arr[0].product(arr[1])
arr_2 = arr[2].product(arr[3])
arr_3 = arr_1.product(arr_2).map(&:flatten)

retval = arr_3.find{|arr| arr[0][1] == (arr[1][0]) && arr[1][1] == (arr[2][0]) && arr[2][1] ==(arr[3][0])}

# require "pry"; binding.pry

p retval
