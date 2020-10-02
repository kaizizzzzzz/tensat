num_passes=1
node_limit=50000
iter_limit=15
time_limit=3000
iter_multi=3
ilp_time_sec=3600

models=(
    #inceptionv3
    #resnext50
    nasrnn
    nasneta
)

for model in "${models[@]}"; do
    for pass in $(seq 0 $(expr $num_passes - 1)); do
        cargo run --release -- -r converted.txt -t converted_multi.txt -u -s none --n_iter $iter_limit --no_order --ilp_time_sec $ilp_time_sec --no_cycle --iter_multi $iter_multi --n_sec $time_limit --n_nodes $node_limit --all_weight_only -e ilp -d $model -o tmp/"$model"_"$iter_multi"_stats.txt --saturation_only # -x tmp/"$model"_optimized.model
    done
done
