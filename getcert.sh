#!/usr/bin/env bash

HOST=$1
PORT=$2

DATE=$(date +'%Y%m%d')
CERT_DIR=${PWD}/cert
CERT_PATH=${CERT_DIR}/${HOST}_${DATE}.pem

if ! command -v openssl &> /dev/null
then
    echo "openssl could not be found"
    exit
fi

if [ ! -d ${CERT_DIR} ]
then
    echo "Directory ${CERT_DIR} DOES NOT exists."
    mkdir ${CERT_DIR}
    echo "created."
fi

if [ -z "$PORT" ]
then
    PORT=443
fi

openssl s_client -showcerts -connect ${HOST}:${PORT} </dev/null 2>/dev/null | \
openssl x509 -outform PEM > ${CERT_PATH} || exc=$?
# openssl x509 -inform PEM -in ${CERT_PATH} -text -out ${CERT_PATH}.txt

if [ "${exc}" = "" ]
then
    openssl x509 -text -noout -in ${CERT_PATH}
    echo "✅ 🔑 ${CERT_PATH}"
else
    rm ${CERT_PATH}
fi

### EOF ###