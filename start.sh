#!/bin/bash

# Stagger workers by a minute
sleep $(( (WORKER_NUMBER - 1) * 2 * 60 ))

cd /utopia
./utopia_bot --token $TOKEN --silent
