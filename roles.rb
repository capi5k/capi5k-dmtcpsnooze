# define your roles here as methods  (this allow roles to be overwritten)
#
# follow the convention :
#
def role_dmtcpsnooze
  $myxp.get_deployed_nodes('capi5k-init')
end
#
#
