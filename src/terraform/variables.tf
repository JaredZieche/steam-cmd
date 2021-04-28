variable aws_region { default = "us-east-2" }
variable default_AZ { default = "us-east-2a" }

variable vpc_name { default = "PocVpc" }
variable cidr_block_main { default = "192.168.188.0/24" }
# ---
# Network for databases
# HostMin:   192.168.188.5  (first four is reserved by amazon)
# HostMax:   192.168.188.14
variable cidr_block_for_db { default = "192.168.188.0/28" }
# ---
# Network for app services
# HostMin:   192.168.188.21 (first four is reserved by amazon)
# HostMax:   192.168.188.30
variable cidr_block_for_app { default = "192.168.188.16/28" }
# ---
# Network for LB
# HostMin:   192.168.188.37 (first four is reserved by amazon)
# HostMax:   192.168.188.46
variable cidr_block_for_lb { default = "192.168.188.32/28" }
# ---
# Network for Bastion Host
# HostMin:   192.168.188.53 (first four is reserved by amazon)
# HostMax:   192.168.188.62
variable cidr_block_for_bhost { default = "192.168.188.48/28" }
# ---
# Constanstant CIDR blocks
variable cidr_block_internet { default = "0.0.0.0/0" }
