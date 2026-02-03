resource "aws_ecs_service" "app_service" {
  name                  = "${var.application}-${var.environment}" # Name the service
  cluster               = data.aws_ecs_cluster.cluster.id         # Reference the created Cluster
  task_definition       = aws_ecs_task_definition.app_task.arn    # Reference the task that the service will spin up
  launch_type           = "FARGATE"
  desired_count         = var.desired_count # Set up the number of containers to 3
  wait_for_steady_state = true
  scheduling_strategy   = "REPLICA"
  force_new_deployment  = true
  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app.arn # Reference the target group
    container_name   = aws_ecs_task_definition.app_task.family
    container_port   = var.port # Specify the container port
  }

  service_registries {
    registry_arn = aws_service_discovery_service.example.arn
  }
  network_configuration {
    subnets          = data.aws_subnets.public.ids
    assign_public_ip = true                                          # Provide the containers with public IPs
    security_groups  = [aws_security_group.service_security_group.id] # Set up the security group
  }
  timeouts {
    create = "7m"
    update = "7m"
  }
}


resource "aws_ecs_task_definition" "app_task" {
  family = "${var.application}-${var.environment}" # Name your task
  container_definitions = jsonencode(
    [
      {
        "name" : "${var.application}-${var.environment}",
        "image" : "${var.ecr_repository_name}:${var.container_version}",
        "essential" : true,
        "logConfiguration" : {
          "logDriver" : "awslogs",
          "options" : {
            "awslogs-group" : aws_cloudwatch_log_group.log.name
            "awslogs-region" : data.aws_region.current.name
            "awslogs-stream-prefix" : var.container_version
          }
        }
        "portMappings" : [
          {
            "containerPort" : "${var.port}",
            "hostPort" : "${var.port}"
          }
        ],
        "memory" : "${var.memory}",
        "cpu" : "${var.cpu}",
      }
  ])

  requires_compatibilities = ["FARGATE"] # use Fargate as the launch type
  network_mode             = "awsvpc"    # add the AWS VPN network mode as this is required for Fargate
  memory                   = var.memory  # Specify the memory the container requires
  cpu                      = var.cpu     # Specify the CPU the container requires
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}

resource "aws_service_discovery_service" "example" {
  name = var.application

  dns_config {
    namespace_id = data.aws_service_discovery_dns_namespace.test.id
    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}