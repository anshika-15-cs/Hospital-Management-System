import mysql.connector as sql
from tkinter import *
connection=sql.connect(host="localhost",user="root",passwd="execute",database="hospital_management")
cur=connection.cursor()
a=Tk()
a.geometry("700x700")
a.title("HOSPITAL MANAGEMENT SYSTEM")
a.config(background="#DCFCCA")
label=Label(a,text="WELCOME TO HOSPITAL MANAGEMENT SYSTEM",font=("Algerian", 20, "bold"),fg="#0623C4",padx=10,pady=10)
label.pack()
guide1=Label(a,text="CHOOSE AN OPTION")
guide1.pack()
def admin_login():
    passwd=int(input("enter your admin password:"))
    if passwd==1985:
        print("login successful")
        print("1. ADD DOCTOR\n2.VIEW DOCTOR\n3. ADD PATIENT\n4. VIEW APPOINTMENTS")
        no=int(input("Enter the number:"))
        if no==1:
            print("give the following details:")
            id1=int(input("ENTER DOCTOR ID:"))
            name=input("ENTER DOCTOR NAME:")
            spec=input("ENTER SPECIALIZATION:")
            phone=int(input("ENTER PHONE NO.:"))
            email=input("ENTER EMAIL:")
            exp=int(input("ENTER EXPERIENCE (IN YEARS):"))
            ins="INSERT INTO doctors(ID,Name,Specialization,Phone,Email,Experience)VALUES({},'{}','{}',{},'{}',{})".format(id1,name,spec,phone,email,exp)
            cur.execute(ins)
            print("ADDED")
            connection.commit()
        if no==2:
            id1=int(input("enter doctor id:"))
            view1="select * from doctors where id=%s"%(id1,)
            cur.execute(view1)
            data=cur.fetchall()
            print(data)
        if no==3:
            print("give the following details:")
            id1=int(input("ENTER PATIENT ID:"))
            name=input("ENTER PATIENT NAME:")
            gender=input("ENTER GENDER ('M' OR 'F'):")
            phone=int(input("ENTER PHONE NO.:"))
            addr=input("ENTER ADDRESS(CITY,STATE):")
            dob=input("ENTER DATE OF BIRTH:")
            ins="INSERT INTO patients(ID,Name,Gender,Phone,Address,DOB)VALUES({},'{}','{}',{},'{}','{}')".format(id1,name,gender,phone,addr,dob)
            cur.execute(ins)
            print("ADDED")
            connection.commit()
        if no==4:
            app=int(input("enter patient id:"))
            view1="select * from appointments where id=%s"%(app,)
            cur.execute(view1)
            data=cur.fetchall()
            print(data)
        else:
            print("THANK YOU. FOR FURTHER TASKS ,GO TO MAIN MENU.")
    else:
        print("INCORRECT PASSWORD")
def patient_login():
    print("1.for new registeration")
    print("2.for checking appointments")
    print("3. for updating any details")
    p=int(input("enter no. (1/2/3): "))
    if p==1:
        print("give the folloing details:")
        id_1=int(input("ENTER PAITENT ID:"))
        NAME=input("ENTER PAITENT NAME:")
        GENDER=input("ENTER GENDER (M/F)")
        PHONE=int(input("ENTER PHONE NO. :"))
        ADDRESS=input("ENTER YOUR ADDRESS:")
        DOB=input("ENTER DATE OF BIRTH :")
        ins="INSERT INTO patients(ID,NAME,GENDER,PHONE,ADDRESS,DOB)VALUES({},'{}','{}','{}','{}','{}')".format(id_1,NAME,GENDER,PHONE,ADDRESS,DOB)
        cur.execute(ins)
        connection.commit()
    elif p==2:
        ID=int(input("ENTER YOU PATIENT ID:"))
        cur.execute("select * from appointments where id=%s"%(ID,))
        connection.commit()
    elif p==3:
        print("Choose the value you want to change\n1.ID\n2.NAME\n3.GENDER\n4.PHONE\n5.ADDRESS\n6.DOB")
        id1=int(input("enter your patient id:"))
        n=int(input("Enter no. of the value (numbers are specified above)you want to change:"))
        if n==1:
            new_id=int(input("Enter new id:"))
            query="update patients set ID=%s where ID=%s"
            cur.execute(query, (new_id,id1))
            print("UPDATED")
            connection.commit()
        elif n==2:
            name_=input("Enter new name:")
            Q="update patients set NAME=%s where ID=%s"
            cur.execute(Q,(name_,id1))
            print("UPDATED")
            connection.commit()
        elif n==3:
            gen=input("Enter correct gender(M/F/other):")
            Q2="update patients set GENDER=%s where ID=%s"
            cur.execute(Q2,(gen,id1))
            print("UPDATED")
            connection.commit()
        elif n==4:
            ph=int(input("Enter new phone no. :"))
            Q3="update patients set PHONE=%s where ID=%s"
            cur.execute(Q3,(ph,id1))
            print("UPDATED")
            connection.commit()
        elif n==5:
            new_add=input("Enter new address:")
            Q4="update patients set ADDRESS=%s here ID=%S"
            cur.execute(Q4,(new_add,id1))
            print("UPDATED")
            connection.commit()
        elif n==6:
            new_dob=input("enter correct dob:")
            Q5="update patients set DOB=%s where ID=%s"
            cur.execute(Q5,(new_dob,id1))
            print("UPDATED")
            connection.commit()
        else:
            print("THANKS FOR VISITING")

def doctor_login():
    ID=int(input("Enter doctor id:"))
    b="select * from appointments where doctor_id=%s"%(ID,)
    cur.execute(b)
    data=cur.fetchall()
    for i in data:
        print(i)
    print("FOR ANY OTHER UPDATION ,CONSULT ADMIN")
def exit1():
    print("THANKS FOR VISITING. STAY SAFE STAY HEALTHY")
button = Button(a, text='SIGN UP AS ADMIN')
button1 = Button(a, text='SIGN UP AS DOCTOR')
button2 = Button(a, text='SIGN UP AS PATIENT')
button3 = Button(a, text='EXIT')
button.pack()
button.config(command=admin_login)
button1.config(command=doctor_login)
button2.config(command=patient_login)
button3.config(command=exit1)
button1.pack()
button2.pack()
button3.pack()
a.mainloop()
