# usage:
#   $ make apply SCOPE=network WORKSPACE=dev
# vars:
#  SCOPE: apply を実行するディレクトリ
#  WORKSPACE: 環境（dev, prd）の指定

SCOPE     := $(SCOPE)
WORKSPACE := $(WORKSPACE)

AWS_DEFAULT_REGION := ap-northeast-1
TFSTATE_BUCKET     := blog-terraform-dir
TFSTATE_KEY        := $(SCOPE)/terraform.tfstate

TF_CMD := docker-compose run --rm \
	-e SCOPE=$(SCOPE)	\
	-e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
	-e TF_VAR_state_bucket=$(TFSTATE_BUCKET) \
	-e TF_WORKSPACE=$(WORKSPACE) \
	terraform

.PHONY: all init

all:
	@more Makefile

init:
	@ $(TF_CMD) init \
	-get=true \
	-backend=true \
	-backend-config="region=$(AWS_DEFAULT_REGION)" \
	-backend-config="bucket=$(TFSTATE_BUCKET)" \
	-backend-config="key=$(TFSTATE_KEY)"

plan: init
	@ $(TF_CMD) plan

apply: init
	@ $(TF_CMD) apply

destroy: init
	@ $(TF_CMD) destroy

workspace: init
	$(TF_CMD) workspace $(ARG)
