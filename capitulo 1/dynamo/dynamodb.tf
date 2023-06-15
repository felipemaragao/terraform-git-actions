resource "aws_dynamodb_table" "dynamodb-terraform-state-locl" {
    name= "terraform-state_lock-dynamo"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
        name = "LockID"
        type = "S"
    }

    tags  = {
        Name = "DynamoDB Tettaform Sate Lock Table"
    }
}