resource "aws_s3_bucket" "mydevops3bucket" {
  # name = "S3 Bucket here"
  bucket = "mydevops3bucket"


  tags = {
    Name        = "S3 Bucket"
    Environment = "Dev"
    # acl    = "public-read" 
  }
}

resource "aws_s3_bucket_ownership_controls" "mydevops3bucket" {
  bucket = aws_s3_bucket.mydevops3bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "mydevops3bucket" {
  bucket = aws_s3_bucket.mydevops3bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "mydevops3bucket" {
  bucket = aws_s3_bucket.mydevops3bucket.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_website_configuration" "mydevops3bucket" {
  bucket = aws_s3_bucket.mydevops3bucket.id

  index_document {
    suffix = "barcode.html"
  }

  error_document {
    key = "barcode.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_bucket_policy" "mydevops3bucket" {
  bucket = aws_s3_bucket.mydevops3bucket.id

  policy = jsonencode({

    "Version" : "2012-10-17",
    "Id" : "Policy1744872674416",
    "Statement" : [
      {
        "Sid" : "Stmt1744872673257",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::116981808740:user/s3user"
        },
        "Action" : "s3:*",
        "Resource" : ["arn:aws:s3:::mydevops3bucket",
          "arn:aws:s3:::mydevops3bucket/*"
        ]
      }
    ]
  })
}