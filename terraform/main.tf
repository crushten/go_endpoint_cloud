module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.26.6"
  cluster_name    = local.cluster_name
  cluster_version = "1.22" // 1.23 is due August 2022 1.24 isnt avaible yet see https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html#version-deprecation
  subnet_ids      = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    root_volume_type = "gp2"
    create_launch_template = false
    launch_template_name   = ""
  }

  eks_managed_node_groups = [
    {
      name                          = "eks_managed_node_1"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.eks_managed_node_group_mgmt_one.id]
      asg_desired_capacity          = 1
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}