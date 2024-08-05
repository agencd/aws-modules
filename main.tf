provider "aws" {
  region = "us-east-1"
}
#
module "users" {
  source = "./modules/users"
  users  = {
    sysadmin1    = "SysAdmin User 1"
    sysadmin2    = "SysAdmin User 2"
    dbadmin1     = "DBAdmin User 1"
    dbadmin2     = "DBAdmin User 2"
    monitoruser1 = "Monitor User 1"
    monitoruser2 = "Monitor User 2"
    monitoruser3 = "Monitor User 3"
    monitoruser4 = "Monitor User 4"
  }
}

module "groups" {
  source = "./modules/groups"
  groups = {
    sysadmins = "System Administrators"
    dbadmins  = "Database Administrators"
    monitors  = "Monitoring Group"
  }
}

module "group_memberships" {
  source = "./modules/group_memberships"
  group_memberships = {
    sysadmins = ["sysadmin1", "sysadmin2"]
    dbadmins  = ["dbadmin1", "dbadmin2"]
    monitors  = ["monitoruser1", "monitoruser2", "monitoruser3", "monitoruser4"]
  }
}

module "access_policies" {
  source         = "./modules/access_policies"
  policy_mapping = {
    sysadmins = "arn:aws:iam::aws:policy/AdministratorAccess"
    dbadmins  = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
    monitors  = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}
