resource "aws_ecr_repository" "frontend" {
  name                 = "prj-front-image"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "backend" {
  name                 = "prj-back-image"
  image_tag_mutability = "MUTABLE"
}
