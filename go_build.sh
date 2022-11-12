#!/usr/bin/bash
archs=(amd64 arm64)
oses=(darwin linux windows )

for os in "${oses[@]}"
    do
        for arch in "${archs[@]}"
            do
                env GOOS="${os}" GOARCH="${arch}" go build -o go_endpoint_cloud_"${os}"_"${arch}"

            done
    done