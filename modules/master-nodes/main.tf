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
# Launch Template
resource "aws_launch_template" "master_template" {
  name          = "${var.cluster_name}-master-template"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.master_sg_id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.cluster_name}-master"
    }
  }
}
# Autoscaling Group for Master Nodes
resource "aws_autoscaling_group" "master_asg" {
  desired_capacity     = var.master_count
  max_size             = var.master_count
  min_size             = var.master_count
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.master_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-master"
    propagate_at_launch = true
  }
}

