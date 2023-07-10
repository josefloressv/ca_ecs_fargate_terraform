app_name = "lab"
ecs_role_arn = "arn:aws:iam::AWSACCOUNT:role/lab-ecs-task-execution-role"
ecs_services = {
  frontend = {
    image          = "AWSACCOUNT.dkr.ecr.us-west-2.amazonaws.com/frontend:1.0.0"
    cpu            = 256
    memory         = 512
    container_port = 8080
    host_port      = 8080
    desired_count  = 2
    is_public      = true
    protocol       = "HTTP"
    auto_scaling = {
      max_capacity    = 3
      min_capacity    = 2
      cpu_threshold    = 50
      memory_threshold = 50
    }
  }
  backend = {
    image          = "AWSACCOUNT.dkr.ecr.us-west-2.amazonaws.com/backend:1.0.0"
    cpu            = 256
    memory         = 512
    container_port = 8080
    host_port      = 8080
    desired_count  = 2
    is_public      = false
    protocol       = "HTTP"
    auto_scaling = {
      max_capacity    = 3
      min_capacity    = 2
      cpu_threshold    = 75
      memory_threshold = 75
    }
  }
}
internal_alb_dns = "internal-lab-internal-1711159751.us-west-2.elb.amazonaws.com"
private_subnet_ids = [
  "subnet-003ae970837d3701f",
  "subnet-0c5dc24f23463d07d"
]
public_subnet_ids = [
  "subnet-0516855ce010c51c2",
  "subnet-0e6ae56287348ffb4"
]
security_group_ids = [
  "sg-0007b57cd3fc941f1",
  "sg-0262dea5e6e309e7a"
]
target_group_arns = {
  backend = {
    arn = "arn:aws:elasticloadbalancing:us-west-2:AWSACCOUNT:targetgroup/backend-tg/78c075682801f0d1"
  }
  frontend = {
    arn = "arn:aws:elasticloadbalancing:us-west-2:AWSACCOUNT:targetgroup/frontend-tg/abaa5bc6b9f5fa7b"
  }
}