# Intelligent-identification-of-the-ECG-ST-segment
## The model architecture of this work is divided into two levels: "feature learning" and "classifier".
The "feature learning" level uses multi-layer LSTM (Stacked LSTM) as the infrastructure, and uses deep learning methods to intelligently identify ST-segment changes in ECG.
In this example, in view of the large amount of data collected by ECG signals and the strong correlation of multiple heartbeat beats, we use a three-layer LSTM architecture, that is, the use of three-layer LSTMs stacked layer by layer to process data, and the output of the previous layer becomes the input of the next layer. The three-layer LSTM architecture can make the model deeper and the extracted features deeper, so that the prediction is more accurate, and it can also ensure that too many ECG signal noises will not be extracted, resulting in overfitting of the model.
The output of the last layer of LSTM is connected to the "Classifier" section. First go through the "layer normalization" layer, first normalize the treatment in the feature dimension, smooth the size relationship between different samples, and retain the size relationship between different features, and then go through two "linear layer", "activation function Rel U" and "discard layer", where the role of "linear layer" is to change the dimension to adapt it to subsequent operations. Through the "activation function Rel U", nonlinear weights are applied to different hidden layer nodes, which makes the output result more complex and improves the expression ability of the neural network. The purpose of the "discarded layer" is to significantly reduce overfitting by ignoring a subset of the number of feature detectors (randomly forcing half of the hidden layer node values to 0).
## environment:Python==3.8.16，pip==23.1.3，torch==1.10.1+cu111。
## you should have
cudatoolkit==11.3.1;
cudnn==8.2.1;
imbalanced-learn==0.10.1;
matplotlib==3.7.1;
numpy==1.24.3;
openpyxl==3.1.2;
pandas==2.0.2;
scipy==1.10.1;
torchaudio==0.10.1+cu111;
torcheval==0.0.6;
torchvision==0.11.2+cu111;
xlswwriter;
seaborn
