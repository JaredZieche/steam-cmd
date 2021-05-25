# BEGIN: Sec Groups
resource "aws_security_group" "sg_allow_internet" {
    name = "sg_allow_internet"
    description = "allow all outcomming traffic"
    vpc_id = "${aws_vpc.default.id}"
# allow internet access, but block all incoming traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.cidr_block_internet}"]
    }
}
resource "aws_security_group" "sg_bastion" {
    name = "sg_bastion"
    description = "allow traffic on bastion host"
    vpc_id = "${aws_vpc.default.id}"
# allow sshd connection
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.cidr_block_internet}"]
    }
}
resource "aws_security_group" "sg_admin" {
    name = "sg_allow_bhost_traffic"
    description = "allow all traffic from bastion host"
    vpc_id = "${aws_vpc.default.id}"
ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.cidr_block_for_bhost}"]
    }
}
# END: Sec Groups
