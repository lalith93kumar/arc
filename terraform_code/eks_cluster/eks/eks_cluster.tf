resource "aws_eks_cluster" "myCluster" {
  name     = var.clusterName
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.public_subnet
  }

  depends_on = [var.policy_depend]

}