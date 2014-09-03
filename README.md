capi5k-dmtcpsnooze
==================

Deployement of the dmtcpsnooze service.

Can be used in conjonction with : 
* capi5k-snooze
* grid5000-xp-ceph

This script isn't yet integrated with the two others, some manual steps are required to feed the
``` application.cfg.erb```file

* The bootstrap address of your snooze deployment
* The S3 endpoint of your ceph deployment

That should be enough.


