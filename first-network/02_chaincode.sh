#!/bin/bash

PEERCLI="docker exec -it cli peer"
PEERCLIORG2="docker exec \
 -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
 -e CORE_PEER_LOCALMSPID=Org2MSP \
 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
-it cli peer"

# $PEERCLI chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "1.0" -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLI channel join -b ./mychannel.block -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "1.0" -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 channel join -b ./mychannel-fetch.block -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 channel list

# $PEERCLIORG2 chaincode instantiate -C mychannel -c '{"Args":["init","a","100","b","200"]}'  -l golang -n mycc -P 'AND ("Org1MSP.peer","Org2MSP.peer")' -v "1.0" \
# --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

$PEERCLIORG2 chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
$PEERCLIORG2 chaincode query -C mychannel -n mycc -c '{"Args":["query","b"]}'

# $PEERCLI chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","a","b","10"]}' \
# --peerAddresses peer0.org1.example.com:7051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
# --peerAddresses peer0.org2.example.com:9051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
# -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLI chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "2.0" -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "2.0" -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 chaincode upgrade -C mychannel -c '{"Args":["init","a","1000","b","2000"]}'  -l golang -n mycc -P 'AND ("Org1MSP.peer")' -v "2.0" \
# --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLI chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","a","b","10"]}' \
# --peerAddresses peer0.org1.example.com:7051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
# --peerAddresses peer0.org2.example.com:9051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
# -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLI chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "3.0" -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "3.0" -o orderer.example.com:7050 --tls \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 chaincode upgrade -C mychannel -l golang -n mycc -c '{"Args":["init","a","10","b","20"]}' -P 'AND ("Org2MSP.peer")' -v "3.0" \
# --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

$PEERCLI chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","a","b","1"]}' \
--peerAddresses peer0.org2.example.com:9051 \
--tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
-o orderer.example.com:7050 --tls \
--cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

