import Network.Socket
import qualified Network.Socket.ByteString as B
import Data.ByteString.Char8(pack,unpack)

main::IO()
main=do
    sock<-socket AF_INET Stream 0
    bind sock (SockAddrInet 8500 iNADDR_ANY)
    listen sock 3
    (csock,_)<-accept sock
    loop csock

loop::Socket->IO()
loop csock=do
    print "Begining of loop"
   -- dat<-B.recv csock 2000
    sent<-B.send  csock $ pack "Hi!!"
   -- print $ unwords  ["Received :",unpack dat]
    print "End of loop"
    loop csock
    

    


    


    
    
