#!/bin/bash

# Definování množin TASK a ALG
tasks=("transport" "passage" "discovery" "balance" "dispersion"  "wheel")
algs=("mappo" "ippo" "masac" "isac" "maddpg" "iddpg")
lr=( "0.00005" "0.01")
nns=("layers/mlp" "layers/gru")

# Iterace přes všechny kombinace TASK a ALG
for nn in "${nns[@]}"; do
  for lr in "${lr[@]}"; do
    for task in "${tasks[@]}"; do
      for alg in "${algs[@]}"; do
        log_file="logs/${lr}_${task}_${nn}_${alg}_.log"
        echo "Spouštím: python vmas_run.py task=vmas/$task algorithm=$alg model=$nn model@critic_model=$nn experiment.max_n_iters=150"
        python vmas_run.py task=vmas/$task algorithm="$alg" model=$nn model@critic_model=$nn experiment.max_n_iters=150 experiment.lr="$lr" > "$log_file" 2>&1
      done
    done
  done
done
