resource "aws_eks_node_group" "myNodeGroup" {
  cluster_name    = aws_eks_cluster.myCluster.name
  node_group_name = "${aws_eks_cluster.myCluster.name}-node-group"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      =  var.public_subnet
  instance_types = ["t2.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
  depends_on = [var.policy_depend]
}