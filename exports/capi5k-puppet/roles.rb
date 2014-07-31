# where puppet will be installed
def role_puppet
  $myxp.get_deployed_nodes('capi5k-init')
end

# puppet version to use (env var)
def puppet_version
  "3.5.1"
end

