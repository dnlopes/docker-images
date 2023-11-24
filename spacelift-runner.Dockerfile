ARG BASE_IMAGE=public.ecr.aws/spacelift/runner-terraform:latest

FROM ${BASE_IMAGE} AS base

USER root

RUN apk add --no-cache make && make --version

USER spacelift
