This repository is to replace your rc.local file if needed

First this to do is to go to the proper folder

```
cd /etc/aasterisk
```

then we can download the script file
```
sudo wget https://raw.githubusercontent.com/KD5FMU/rc.local-replacement/refs/heads/main/replace_rc_local.sh
```

Then we need to make it executable
```
sudo chmod +x replace_rc_local.sh
```

Once this is done we can execute the script file.

```
sudo ./replace_rc.local.sh
```

Reboot the node and  hope this helps

73 DE KD5FMU


