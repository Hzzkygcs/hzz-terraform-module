### Required Arguments
variable "instance_name"{
  type = string
}
variable "key_filename"{
  type = string
}
variable "automatic_turn_off"{
  type = bool
}
variable "instance_ssh_aws_key_name"{  # you can refer to ../key_pair module
  type = string
}


### Optional Arguments
variable "aws_target_vpc_id" {
  type = string
  default = null
}
variable "aws_key_filename"{
  type = string
  default = null
}
variable "instance_type" {
  default = "t2.micro"
  type = string
}
variable "temporary_script_location"{
  type = string
  default = "./.terraform/temporary.bat"
}
variable "automatic_turn_off_config" {
  type = object({
    shutdown_duration_in_seconds = number

    # since when will the user be warned about the auto-turn-off ?
    seconds_to_start_counting_down_before_due_time = number
    counting_down_increment = number  # will be re-warned again every X seconds
  })

  default = {
    "shutdown_duration_in_seconds": 3600,
    "seconds_to_start_counting_down_before_due_time": 300,
    "counting_down_increment": 59,
  }
}