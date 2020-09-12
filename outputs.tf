output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_all_subnets" {
  description = "Kubernetes VPC All Subnets"
  value       = data.aws_subnet_ids.eks_subnets.ids
}

output "vpc_public_subnets" {
  description = "Kubernetes VPC Public Subnets"
  value       = data.aws_subnet_ids.eks_subnets_public.ids
}

output "vpc_private_subnets" {
  description = "Kubernetes VPC Private Subnets"
  value       = data.aws_subnet_ids.eks_subnets_private.ids
}


output "aws_efs_id" {
  description = "AWS EFS ID to be use in EKS Persistence Volume"
  value       = aws_efs_file_system.aws_efs.id
}


output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "cluster_id" {
  description = "Kubernetes Cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}



/*output "nginx_ingress_hostname" {
  value = data.kubernetes_service.nginx_service_aws_nlb.load_balancer_ingress.0.hostname
  description = "NGINX Ingress Hostname"
}

output "nginx_ingress_ip" {
  value = data.kubernetes_service.nginx_service_aws_nlb.load_balancer_ingress.0.ip
  description = "NGINX Ingress IP Address"
}

output "nginx_nlb_zone_id" {
  value = data.aws_lb.nginx_nlb.zone_id
  description = "Zone ID of Network Load balancerd deployed by NGINX service"
}*/

/*
output "eks_node_groups_node_groups" {
  value = module.eks_node_groups.node_groups
}

output "eks_node_groups_aws_auth_roles" {
  value = module.eks_node_groups.aws_auth_roles
}
*/

