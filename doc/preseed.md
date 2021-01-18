# Preseeding

## Create password hash
```
mkpasswd -m sha-512 ${PASSWORD}
```

## Kernel parameters
```
auto=true netcfg/disable_autoconfig=true url=https://example.com/path/to/preseed
```

## Check preseed file syntax
```
debconf-set-selections -c ${PRESEED_FILE}
```
