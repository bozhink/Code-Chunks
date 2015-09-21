import ftplib, sys
ftp1 = ftplib.FTP("127.0.0.1", "book", "bookpw")
ftp1.cwd("/Dir")
ftp2 = ftplib.FTP("www.holdenweb.com", "bookuser", "bookpw")
ftp2.cwd("/public")
sock1 = ftp1.transfercmd("RETR a.zip")
sock2 = ftp2.transfercmd("STOR b.zip")

flen = 0                            
while 1:
    block = sock1.recv(1024)        
    if len(block) == 0:             
        break
    flen += len(block)              
    while len(block) > 0:           
        sentlen = sock2.send(block) 
        block = block[sentlen:]     
        
print "Transferred", flen, "bytes"

sock1.close()
sock2.close()
ftp1.quit()
ftp2.quit()
