import csv

fname = open('./lab_11_data.csv', 'r')
records = csv.DictReader(fname)

record_book = []

# Symbol,Open,High,Low,LTP,Chng,% Chng

for entry in records:
    new_entry = [
        entry['Symbol'], # 0
        float(entry['Open'].replace(',','')), # 1
        float(entry['High'].replace(',','')), # 2
        float(entry['Low'].replace(',','')), # 3
        float(entry['LTP'].replace(',','')), # 4
        float(entry['Chng'].replace(',','')), # 5
        float(entry['% Chng'].replace(',','')) # 6
    ]

    record_book.append(new_entry)

#print(record_book)

after_second = []

after_second = list(filter(lambda x: (float(x[6]) >= -3.0), record_book)) 
#print(after_second)

sum_open = sum(map(lambda x : float(x[1]), after_second))
avg_val_open = round((sum_open / len(after_second)), 2)

sum_high = sum(map(lambda x : float(x[2]), after_second))
avg_val_high = round((sum_high / len(after_second)), 2)

sum_low = sum(map(lambda x : float(x[3]), after_second))
avg_val_low = round((sum_low / len(after_second)), 2)

avg_output_file = open("avg_output.txt", "w")

avg_output_file.write(str(avg_val_open) + "\n")
avg_output_file.write(str(avg_val_high) + "\n")
avg_output_file.write(str(avg_val_low) + "\n")

avg_output_file.close()

after_fourth = []
ch = input("Enter Character - ")
after_fourth = list(filter(lambda x: (x[0][0] == ch), after_second))
#print(after_fourth)

stock_output = open("stock_output.txt", "w")

for record in after_fourth:
    new_e = record[0] + " " + str(record[1]) + " " + str(record[2]) + " " + str(record[3]) + " " + str(record[4]) + " " + str(record[5]) + " " + str(record[6]) + "\n"
    stock_output.write(new_e)

stock_output.close()







