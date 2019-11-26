export CUDA_VISIBLE_DEVICES=1
rm -rf ./snapshots
rm stdout.txt
rm -rf log
python run_pretraining.py                                                                     \
  --gpu_num_per_node=1                                                                        \
  --node_num=1                                                                                \
  --node_list='192.168.1.15'                                                                  \
  --learning_rate=1e-4                                                                        \
  --weight_l2=0.01                                                                            \
  --batch_size_per_device=24                                                                  \
  --iter_num=1                                                                                \
  --log_every_n_iter=10                                                                       \
  --data_dir="/dataset/bert/of_wiki_seq_len_128"                                              \
  --data_part_num=1                                                                           \
  --model_load_dir="/dataset/model_zoo/bert_new_snapshot/of_L-12_H-768_A-12_random_init"      \
  --model_save_dir="snapshots"                                                                \
  --seq_length=128                                                                            \
  --max_predictions_per_seq=20                                                                \
  --num_hidden_layers=12                                                                      \
  --num_attention_heads=12                                                                    \
  --max_position_embeddings=512                                                               \
  --type_vocab_size=2                                                                         \
  --vocab_size=30522                                                                          \
  --attention_probs_dropout_prob=0                                                            \
  --hidden_dropout_prob=0                                                                     \
  --hidden_size_per_head=64 --inplace > stdout.txt
