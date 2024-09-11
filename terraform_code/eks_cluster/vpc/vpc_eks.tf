module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"
  name = "Nat-Test"
  cidr = "10.0.0.0/16"
  azs  = ["${var.region}a","${var.region}b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Environment = var.clusterName
  }
  public_subnet_tags = {
    Type = "public"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = "1"
  }

  private_subnet_tags = {
    Type = "private"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
  }

  # Automatically assign public IPs to instances launched in public subnets
  map_public_ip_on_launch = true
}