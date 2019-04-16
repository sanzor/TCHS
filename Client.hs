import Data.ByteString.Char8(pack,unpack)
import Network.Socket
import qualified Network.Socket.ByteString as B (send,recv)

main::IO()
main=do
    handle<-connectTo "127.0.0.1" (PortNumber 5555)
    hSetBuffering handle LineBuffering
    loop handle 

loop::Handle->IO()
loop h=do
    h