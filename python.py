python_list = ['Python', 'Kernellix', 'Internship', '2020', 'Training']

def writer():
    file = open('logs.txt','w')
    for ele in python_list:
        file.write(ele+'\n')
    file.close()

def reader():
    file = open('logs.txt', 'r')
    reader.Lines= file.readlines()
    file.close()

def printer():
    for line in reader.Lines:
        print(line)

def main():
    writer()
    reader()
    printer()

if __name__ == '__main__':
    main()
