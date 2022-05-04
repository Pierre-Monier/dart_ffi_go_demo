#!/bin/bash

cd go;
go build -buildmode=c-shared -o lib.a lib.go;
cd ..;