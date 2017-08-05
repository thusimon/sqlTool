import tkinter as tk
from tkinter import *
from tkinter import ttk
import sqlite3 as lite
from datetime import datetime

class mainWin(tk.Frame):
    def __init__(self, master=None):
        self.winName = "MyDBWindow"
        self.master = master
        self.conn = None
        self.tableName = None
        super().__init__(master)
        self.create_widgets()
        self.master.protocol("WM_DELETE_WINDOW", self.on_exit)
        self.master.title("Learning Database...")
        self.master.resizable(width=FALSE, height=FALSE)

    def create_widgets(self):
        #connection to db
        self.dbnameLabel = tk.Label(self.master, text="DB Name:", justify=LEFT)
        self.dbnameLabel.grid(row=0, column=0, sticky=W)
        self.dbName = StringVar()
        self.dbName.set("storage1")
        self.dbnameEntry = tk.Entry(self.master, textvariable=self.dbName, justify=LEFT, width=200)
        self.dbnameEntry.grid(row=0, column=1, sticky=W)
        self.dbnameSet = tk.Button(self.master, text="Set", command = self.dbChooseBtn_callback)
        self.dbnameSet.grid(row=0, column=2, sticky=E)

        #db table name and table content view
        self.tableLabel = tk.Label(self.master, text="Tables and content:", justify=LEFT)
        self.tableLabel.grid(row=1, column=0, sticky=W)
        self.tableNames = tk.Listbox(self.master, width=20, height=20)
        self.tableNames.bind('<<ListboxSelect>>', self.tableSelected_callback)
        self.tableNames.grid(row=2, column=0, sticky=W)

        self.tableContent = ttk.Treeview(self.master)
        self.tableContent.grid(row=2, column=1, columnspan=2, sticky=N+S+W+E)

        #commands
        self.commandLabel = tk.Label(self.master, text="Command:")
        self.commandLabel.grid(row=3, column=0, sticky=W)
        self.commandText = tk.Text(self.master, height=5)
        self.commandText.grid(row=4, column=0, columnspan=2, sticky=W+E)
        self.commandSubmit = tk.Button(self.master, text="Submit", command=self.commandSubmitBtn_callback)
        self.commandSubmit.grid(row=4, column=2, sticky=N+S+W+E)

        #logs and results
        self.logLabel = tk.Label(self.master, text="Logs and Results:")
        self.logLabel.grid(row=5, column=0, sticky=W)
        self.logTexts = tk.Text(self.master, height=5, width=100)
        self.logTexts.grid(row=6, column=0, columnspan=3, sticky=W+E)

    def log(self, message):
        curTime = datetime.utcnow()
        logmsg = "[" + str(curTime) + "] " + message + "\n"
        print(logmsg)
        self.logTexts.insert(END, logmsg)
        self.logTexts.see(END)

    def dbChooseBtn_callback(self):
        dbname = self.dbName.get()+".db"
        self.conn = lite.connect(dbname)
        self.log("Click db set button, connect to " + dbname)
        self.update_tableList()

    def commandSubmitBtn_callback(self):
        if not self.conn:
            self.log("Please connect to database first")
            return

        command = self.commandText.get(1.0,END)
        if command:
            try:
                cur = self.conn.cursor()
                cur.execute(command)
                exeresult = cur.fetchall()
                self.conn.commit()
                self.log("Execute success result: ")
                self.log(str(exeresult))
            except:
                self.log("failed to execute command: " + command)
        else:
            self.log("Invalid command")

        self.update_tableList()
        self.update_tableContent(self.tableName)

    def update_tableList(self):
        if not self.conn:
            self.log("no connection, can't update table list")
            return
        cur = self.conn.cursor()
        cur.execute("select name from sqlite_master where type='table'")
        exeresult = cur.fetchall()
        self.tableNames.delete(0, END)
        for tbname in exeresult:
            self.tableNames.insert(END,tbname[0])

    def tableSelected_callback(self, evt):
        w = evt.widget
        index = int(w.curselection()[0])
        value = w.get(index)
        self.log("You selected table " + value)
        self.tableName = value
        self.update_tableContent(value)

    def getSchemas(self, sqlTableInfo):
        res = ()
        for attr in sqlTableInfo:
            res = res + (attr[1],)
        return res

    def update_tableContent(self, tableName):
        if not self.conn:
            self.log("no connection, can't update table list")
            return
        if not tableName:
            self.log("invalid table, can't update table list")
            return
        cur = self.conn.cursor()
        cur.execute("pragma table_info({0})".format(tableName))
        schemas = cur.fetchall()
        self.log("Updating table {0} contents".format(tableName))
        for row in self.tableContent.get_children():
            self.tableContent.delete(row)

        if len(schemas)<1:
            self.log("Schemas is empty, do nothing")
            return

        schemaTuple = self.getSchemas(schemas)

        #insert the schema
        self.tableContent['columns'] = schemaTuple
        self.tableContent.heading("#0", text="0")
        self.tableContent.column("#0", stretch=False, width=0)
        for idx in range(0,len(schemaTuple)):
            attr = schemaTuple[idx]
            idxstr = "#{0}".format(idx+1)
            self.tableContent.heading(idxstr, text=attr)
            self.tableContent.column(idxstr, stretch=True)

        #insert tuples
        cur.execute("select * from {0}".format(tableName))
        tuples = cur.fetchall()
        for tuple in tuples:
            self.tableContent.insert('', 'end', text="0", values=tuple)

    def on_exit(self):
        if self.conn:
            self.conn.close()

        self.log("Goodbye")
        self.master.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    mywin = mainWin(master=root)
    mywin.mainloop()