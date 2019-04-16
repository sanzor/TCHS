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
    dat<-B.recv csock 1024
    sent<-B.send  csock $ pack "From Server: i received -"
    print $ unwords  ["Got",unpack dat]
    loop csock
    

    


    


    
    
