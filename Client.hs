import Network(connect,Socket,PortID(..))
import System.IO(hPutStrLn,hClose,hSetBuffering,BufferMode(..))

main::IO()
main=do
    handle<-connectTo "127.0.0.1" (PortNumber 5555)
    hSetBuffering handle LineBuffering
    loop handle 

loop::Handle->IO()
loop h=do
    h