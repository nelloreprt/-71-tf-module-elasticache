# step-2 Redis Instance (no cluster)
resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.env}-cluster-elasticache"
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  engine_version       = var.engine_version
  # (OPTIONAL) parameter_group_name = "default.redis3.2"  # as we specified "engine"
  port                 = 6379
  elasticache_subnet_group_name = aws_elasticache_subnet_group.main.name
}


# step-1
resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.env}-elasticache-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(var.tags,
    { Name = "${var.env}-subnet-group" })
}


