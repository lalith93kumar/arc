resource "aws_iam_role" "myClusterRole" {
  name               = "${var.clusterName}-role"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "aws-provided-policy-basic" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.myClusterRole.name
}

resource "aws_iam_role_policy_attachment" "aws-provided-policy-vpc-controlller" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.myClusterRole.name
}
