* Assumitions:
 * Test user: anovilTest
 * Test bucket: iam-anovil-test
 * Home folder: home/anovil-test

S3 bucket policy: 

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1469871826000",
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": [
                "arn:aws:s3:::*"
            ]
        },
        {
            "Sid": "Stmt1469871908000",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "arn:aws:s3:::iam-anovil-test"
            ]
        },
        {
            "Sid": "Stmt1469872164000",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Condition": {
                "StringEquals": {
                    "s3:prefix": "home/anovil-test/*"
                }
            },
            "Resource": [
                "arn:aws:s3:::iam-anovil-test"
            ]
        },
        {
            "Sid": "Stmt1469872264000",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::iam-anovil-test/home/anovil-test"
            ]
        },
        {
            "Sid": "Stmt1469872306000",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::iam-anovil-test/home/anovil-test/*"
            ]
        }
    ]
}
```
