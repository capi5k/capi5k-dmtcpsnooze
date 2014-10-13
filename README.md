capi5k-dmtcpsnooze
==================

Deployement of the dmtcpsnooze service.

Can be used in conjonction with :
* capi5k-snooze
* grid5000-xp-ceph

This script isn't yet integrated with the two others, some manual steps are required to feed the
``` application.cfg.erb``` file

* The bootstrap address of your snooze deployment
* The S3 endpoint of your ceph deployment

That should be enough.

Note : a patch to snooze is required : https://github.com/snoozesoftware/snoozenode/commit/1c6f21b8a9707ba3cfeb1f130f0d0d2d42a221d4

In capi5k-snooze/config.rb be sure to have

```ruby

:set :snoozenode_deb_url, "https://ci.inria.fr/snooze-software/view/maint/job/maint-2.1.0-snoozenode/ws/distributions/deb-package/snoozenode_2.1.6-0_all.deb"

```
