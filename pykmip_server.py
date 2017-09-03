#!/usr/bin/python

import logging

from kmip.services.kmip_server import KMIPServer

def main():

    logger = logging.getLogger(__name__)

    server = KMIPServer(
        host="127.0.0.1",
        port=5696,
        keyfile="./server.pem",
        certfile="./server.pem",
        cert_reqs="CERT_REQUIRED",
        ssl_version="PROTOCOL_TLSv1",
        ca_certs="./ca.pem",
        do_handshake_on_connect=True,
        suppress_ragged_eofs=True)

    logger.info("Starting KMIP server")

    try:
        server.serve()
    except Exception as e:
        logger.info("Exception received while serving: {0}".format(e))
    finally:
        server.close()

    logger.info("Stopping KMIP server")


if __name__ == '__main__':
    main()
