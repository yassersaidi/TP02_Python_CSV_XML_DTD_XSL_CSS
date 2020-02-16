#import csv module
import csv 
#get the csv file and the xml file 
txt_file = open("etudiants.txt","r")
xml_file = open("students.xml","w")

csv_reader = csv.reader(txt_file,delimiter=',')

#head of the xml file
xml_t = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE students SYSTEM "students.dtd">
<?xml-stylesheet type="text/css" href="students.css"?>
    <students>"""
#add xml_t to the xml file

xml_file.write(xml_t)

#start read the csv file and append the items to lists

students_list_def = []
students_list_body = []

line_in = 0
item_in = 0

for item in csv_reader:
    if line_in == 0:
        while item_in < len(item):
            students_list_def.append(item[item_in])
            item_in+=1
        line_in+=1
    else:
        students_list_body.append(item)
        line_in += 1
line_o = 0
item_in = 0
nmbr_admis = 0 
nmbr_ajournne = 0
nmbr_admis_a_dette = 0
for itemD in students_list_body:
    xml_file.write("""
        <student>
        """)
    if line_o != len(students_list_body):
        while item_in != len(students_list_def):
            for item_h in students_list_def:
                xml_file.write("""\t<"""+item_h+""">"""+itemD[item_in]+"""</"""+item_h+""">\n\t\t""")
                item_in += 1
            line_o += 1
        item_in = 0
        xml_file.write("""\t<moyenne>%s</moyenne>\n"""%((float(itemD[3])+float(itemD[4]))/2))
        if float(itemD[3]) >= 10 and float(itemD[4]) >= 10:
            nmbr_admis += 1
            xml_file.write("""\t\t\t<observation> Admis </observation>\n""")
        elif float(itemD[3]) < 10 or float(itemD[4]) < 10:
            if int(itemD[5]) > 45:
                nmbr_admis_a_dette += 1
                xml_file.write("""\t\t\t<observation> Admis ave detts </observation>\n""")
            else:
                nmbr_ajournne += 1
                xml_file.write("""\t\t\t<observation> Ajournee </observation>\n""")

    xml_file.write("""\t\t</student>""")
xml_file.write("""
    </students>""")






