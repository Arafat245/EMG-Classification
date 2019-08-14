# EMG-Classification
This repository contains code for basic finger and hand gesture classification using EMG signal as input and some pretrained deep neural 
networks such as -googlenet, Alexnet etc. Dataset has been taken from [Rami Khusaba Electromyogram repository](https://www.rami-khushaba.com/electromyogram-emg-repository.html) [[1]](https://onedrive.live.com/authkey=%21As%5FiNPKzgU6LJCU&id=AAA78954F15E6559%21295&cid=AAA78954F15E6559).

## Steps for running this code
### Step 1
First download the dataset from [this link](https://onedrive.live.com/authkey=%21As%5FiNPKzgU6LJCU&id=AAA78954F15E6559%21295&cid=AAA78954F15E6559). This is the first dataset of [Rami Khusaba Electromyogram repository](https://www.rami-khushaba.com/electromyogram-emg-repository.html). It contains 10 classes of individual finger movements, i.e.,Thumb (T), Index (I), Middle (M), Ring (R),Thumb–Index (T–I), Thumb–Middle (T–M), Thumb–Ring (T–R), Thumb–Little (T–L), hand close (HC), Little (L), Thumb–Little (T–L) from 10 subjects. We only used first 8 classes.  

### Step 2
Open MATLAB and click on the file named `Hd` (A Bandpass Butterworth filter object)  to import it in MATLAB workspace. 

### Step 3
Run the function `read` in MATLAB command window in the following style -
```
EMGData = read(sub, Hd);
```
Here sub = 1,2,3,..etc. the desired number of subjects you want to read.

### Step 4
Now run the file `script' section by section using ![Image of Yaktocat](https://github.com/Arafat245/EMG-Classification/blob/master/Capture.JPG) in the following style -
```
parentDir = './';
dataDir = 'EMGD1All';
helperCreateEMGDirectories(EMGData,parentDir,dataDir)
```
