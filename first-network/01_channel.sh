#!/bin/bash

PEERCLI="docker exec -it cli peer"
PEERCLIORG2="docker exec \
 -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
 -e CORE_PEER_LOCALMSPID=Org2MSP \
 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
-it cli peer"

# $PEERCLI channel create -c mychannel -f channel-artifacts/channel.tx -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLI channel join -b ./mychannel.block -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 channel fetch config mychannel-fetch.block -c mychannel -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

# $PEERCLIORG2 channel join -b ./mychannel-fetch.block -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem

$PEERCLIORG2 channel list