module "vpc_details" {
    source = "./vpc"
    region = var.region
    clusterName = var.clusterName
}

module "iam_details" {
    source = "./iam"
    clusterName = var.clusterName
}

module "eks_details" {
    source = "./eks"
    clusterName = var.clusterName
    policy_depend = module.iam_details.policy_depend
    eks_role_arn = module.iam_details.eks_role_arn
    eks_node_role_arn = module.iam_details.eks_node_role_arn
    public_subnet = module.vpc_details.public_subnet_ids
}