# Fetch the latest Ubuntu 24.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical account ID for Ubuntu AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Create master nodes
resource "aws_instance" "master" {
  count         = var.master_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(var.subnet_ids, count.index)

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name        = "${var.cluster_name}-master-${count.index + 1}"
    Environment = var.environment
  }
}

