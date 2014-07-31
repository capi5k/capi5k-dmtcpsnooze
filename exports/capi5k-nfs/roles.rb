def role_nfs_server
  $myxp.get_deployed_nodes('capi5k-init').first 
end

def role_nfs_slave
  $myxp.get_deployed_nodes('capi5k-init')
end

def nfs_exported
    "/opt/dmtcp"
end

def nfs_local_mounted
    "/opt/nfs/dmtcp"
end

def uid
  "nobody"
end

def gid
  "nogroup"
end


def nfs_mount_options
  "rw,nfsvers=3,hard,intr,async,noatime,nodev,nosuid,auto,rsize=32768,wsize=32768"
end

def nfs_export_options
  "*(rw,async,no_subtree_check,all_squash)"
end

