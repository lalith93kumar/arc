output "policy_depend" {
  value = [
    aws_iam_role_policy_attachment.aws-provided-policy-basic,
    aws_iam_role_policy_attachment.aws-provided-policy-vpc-controlller,
    aws_iam_role_policy_attachment.aws-provided-policy-ecr-readonly,
    aws_iam_role_policy_attachment.aws-provided-policy-cni-policy,
    aws_iam_role_policy_attachment.aws-provided-policy-vpc-controlller-workerNodePolicy,
  ]
}

output "eks_role_arn" {
    value = aws_iam_role.myClusterRole.arn
}

output "eks_node_role_arn" {
    value = aws_iam_role.myNodeGroup-role.arn
}