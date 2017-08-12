Bitcoin three nodes private network in regtest mode
---------------------------------------------------

- Node Pool
  - RPC Port 19001, Username: user, Password: pass
- Node Bob
  - RPC Port 19002, Username: user, Password: pass
- Node Alice
  - RPC Port 19003, Username: user, Password: pass

To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 19001:19001 -p 19002:19002 -p 19003:19003 oweichhold/bitcoin-private-testnet
```

Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:19001/
```
