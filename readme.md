# Simple and easy Java based box.

I often find myself `vagrant up`, update system and install branch of peripheral packages including setting `JAVA_HOME` at all time. To end that mundane tasks, there are few useful provision scripts here to automate them.

The box is also opted to get rid of synced directory problem which related to require dependencies like rsynch.

- Install JDK and set `JAVA_HOME`
- Install `unzip`
- Install `ntp` and enabled `ntpd` service
- Install `wget`
- Install `net-tools`
- Install `mlocate` and updatedb

