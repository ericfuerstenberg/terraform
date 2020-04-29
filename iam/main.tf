resource "aws_iam_user" "myUser" {
	name = "Test"
}

resource "aws_iam_policy" "customPolicy" {
	name = "MyCustomPolicy"
	policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudtrail:LookupEvents",
                "cloudtrail:GetTrail",
                "cloudtrail:ListTrails",
                "cloudtrail:ListPublicKeys",
                "cloudtrail:ListTags",
                "cloudtrail:GetTrailStatus",
                "cloudtrail:GetEventSelectors",
                "cloudtrail:GetInsightSelectors",
                "cloudtrail:DescribeTrails"
            ],
            "Resource": "*"
        }
    ]
}
	EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
	name = "attachment"
	users = ["${aws_iam_user.myUser.name}"]
	policy_arn = "${aws_iam_policy.customPolicy.arn}"
}