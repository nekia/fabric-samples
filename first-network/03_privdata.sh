#!/bin/bash

export ORDERERCA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

export PEERCLI="docker exec -it cli peer"

export PEERCLIORG1PEER1="docker exec \
 -e CORE_PEER_ADDRESS=peer1.org1.example.com:8051 \
 -e CORE_PEER_LOCALMSPID=Org1MSP \
 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt \
 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp \
-it cli peer"

export PEERCLIORG2="docker exec \
 -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
 -e CORE_PEER_LOCALMSPID=Org2MSP \
 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
-it cli peer"

export PEERCLIORG2PEER1="docker exec \
 -e CORE_PEER_ADDRESS=peer1.org2.example.com:10051 \
 -e CORE_PEER_LOCALMSPID=Org2MSP \
 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt \
 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
-it cli peer"

# $PEERCLI chaincode install -l golang -n marblesp \
# -p github.com/chaincode/marbles02_private/go \
# -v 1.0 

# $PEERCLIORG1PEER1 chaincode install -l golang -n marblesp \
# -p github.com/chaincode/marbles02_private/go \
# -v 1.0 

# $PEERCLIORG2 chaincode install -l golang -n marblesp \
# -p github.com/chaincode/marbles02_private/go \
# -v 1.0 

# $PEERCLIORG2PEER1 chaincode install -l golang -n marblesp \
# -p github.com/chaincode/marbles02_private/go \
# -v 1.0 

# $PEERCLI chaincode instantiate -C mychannel \
# -c '{"Args":["init"]}' -n marblesp \
# -P "OR('Org1MSP.member','Org2MSP.member')" \
# -v 1.0 \
# -o orderer.example.com:7050 \
# --collections-config /opt/gopath/src/github.com/chaincode/marbles02_private/collections_config.json \
# --tls --cafile $ORDERERCA

# export MARBLE=$(cat 03_privdata.json | jq . -c -M | base64 | tr -d '\n')
# $PEERCLI chaincode invoke -o orderer.example.com:7050 \
# -C mychannel -n marblesp \
# -c '{"Args":["initMarble"]}' \
# --transient "{\"marble\":\"$MARBLE\"}" \
# --tls --cafile $ORDERERCA

# $PEERCLI chaincode query -C mychannel -n marblesp -c '{"Args":["readMarble","marble1"]}'
# $PEERCLI chaincode query -C mychannel -n marblesp -c '{"Args":["readMarblePrivateDetails","marble1"]}'

# $PEERCLIORG2 chaincode query -C mychannel -n marblesp -c '{"Args":["readMarble","marble1"]}'
# $PEERCLIORG2 chaincode query -C mychannel -n marblesp -c '{"Args":["readMarblePrivateDetails","marble1"]}'

export MARBLE2=$(cat 03_privdata2.json | jq . -c -M | base64 | tr -d '\n')
$PEERCLI chaincode invoke -o orderer.example.com:7050 \
-C mychannel -n marblesp \
-c '{"Args":["initMarble"]}' \
--transient "{\"marble\":\"$MARBLE2\"}" \
--tls --cafile $ORDERERCA

export MARBLE3=$(cat 03_privdata3.json | jq . -c -M | base64 | tr -d '\n')
$PEERCLI chaincode invoke -o orderer.example.com:7050 \
-C mychannel -n marblesp \
-c '{"Args":["transferMarble"]}' \
--transient "{\"marble_owner\":\"$MARBLE3\"}" \
--tls --cafile $ORDERERCA

export MARBLE4=$(cat 03_privdata4.json | jq . -c -M | base64 | tr -d '\n')
$PEERCLI chaincode invoke -o orderer.example.com:7050 \
-C mychannel -n marblesp \
-c '{"Args":["transferMarble"]}' \
--transient "{\"marble_owner\":\"$MARBLE4\"}" \
--tls --cafile $ORDERERCA

export MARBLE5=$(cat 03_privdata5.json | jq . -c -M | base64 | tr -d '\n')
$PEERCLI chaincode invoke -o orderer.example.com:7050 \
-C mychannel -n marblesp \
-c '{"Args":["transferMarble"]}' \
--transient "{\"marble_owner\":\"$MARBLE5\"}" \
--tls --cafile $ORDERERCA

# $PEERCLI channel join -b ./mychannel.block -o orderer.example.com:7050 --tls --cafile $ORDERERCA

# $PEERCLIORG2 chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "1.0" -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLIORG2 channel join -b ./mychannel-fetch.block -o orderer.example.com:7050 --tls --cafile $ORDERERCA

# $PEERCLIORG2 channel list

# $PEERCLIORG2 chaincode instantiate -C mychannel -c '{"Args":["init","a","100","b","200"]}'  -l golang -n mycc -P 'AND ("Org1MSP.peer","Org2MSP.peer")' -v "1.0" \
# --tls --cafile $ORDERERCA

# $PEERCLIORG2 chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
# $PEERCLIORG2 chaincode query -C mychannel -n mycc -c '{"Args":["query","b"]}'

# $PEERCLI chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","a","b","10"]}' \
# --peerAddresses peer0.org1.example.com:7051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
# --peerAddresses peer0.org2.example.com:9051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
# -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLI chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "2.0" -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLIORG2 chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "2.0" -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLIORG2 chaincode upgrade -C mychannel -c '{"Args":["init","a","1000","b","2000"]}'  -l golang -n mycc -P 'AND ("Org1MSP.peer")' -v "2.0" \
# --tls --cafile $ORDERERCA

# $PEERCLI chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","a","b","10"]}' \
# --peerAddresses peer0.org1.example.com:7051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
# --peerAddresses peer0.org2.example.com:9051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
# -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLI chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "3.0" -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLIORG2 chaincode install -l golang -n mycc \
# -p github.com/chaincode/chaincode_example02/go \
# -v "3.0" -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

# $PEERCLIORG2 chaincode upgrade -C mychannel -l golang -n mycc -c '{"Args":["init","a","10","b","20"]}' -P 'AND ("Org2MSP.peer")' -v "3.0" \
# --tls --cafile $ORDERERCA

# $PEERCLI chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","a","b","1"]}' \
# --peerAddresses peer0.org2.example.com:9051 \
# --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
# -o orderer.example.com:7050 --tls \
# --cafile $ORDERERCA

