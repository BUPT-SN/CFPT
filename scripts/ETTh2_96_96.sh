export CUDA_VISIBLE_DEVICES=2

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/CFPT" ]; then
    mkdir ./log/CFPT
fi

if [ ! -d "./log/CFPT/etth2" ]; then
    mkdir ./log/CFPT/etth2
fi

model_name=CFPT


# ETTh2
for seq_len in 96
do
for beta in 0.6
do
for seed in 2025
do
for d_model in 256
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'96 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len 96 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 2 \
  --beta $beta \
  --learning_rate 0.0001 \
  --batch_size 4 \
  --e_layers 1 \
  --d_model $d_model \
  --t_layers 3 \
  --train_epochs 10 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/CFPT/etth2/$seq_len'_'96.txt
done
done
done
done

for seq_len in 96
do
for beta in 0.4
do
for seed in 2023 2024 2025
do
for d_model in 256 512 1024
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'192 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len 192 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 2 \
  --beta $beta \
  --learning_rate 0.0005 \
  --batch_size 4 \
  --train_epochs 10 \
  --e_layers 12 \
  --d_model $d_model \
  --t_layers 3 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/CFPT/etth2/$seq_len'_'192.txt
done
done
done
done

for seq_len in 96
do
for beta in 0.3
do
for seed in 2023 2024 2025
do
for batch_size in 32
do
for learning_rate in 0.0001
do
for pred_len in 336
do
for d_model in 256 512 1024
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'336 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta $beta \
  --learning_rate $learning_rate \
  --batch_size $batch_size \
  --e_layers 6 \
  --d_model $d_model \
  --t_layers 3 \
  --train_epochs 10 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/CFPT/etth2/$seq_len'_'$pred_len.txt
done
done
done
done
done
done
done



for seq_len in 96
do
for beta in 0.4
do
for seed in 2023 2024 2025
do
for batch_size in 32
do
for learning_rate in 0.0001
do
for pred_len in 720
do
for d_model in 256 512 1024
do
python -u run.py \
  --time_feature_types HourOfDay MonthOfYear SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'$pred_len \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 2 \
  --beta $beta \
  --learning_rate $learning_rate \
  --batch_size $batch_size \
  --e_layers 1 \
  --d_model $d_model \
  --t_layers 3 \
  --train_epochs 10 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/CFPT/etth2/$seq_len'_'$pred_len.txt
done
done
done
done
done
done
done