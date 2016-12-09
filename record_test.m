recorder = audiorecorder(8e3,16,1);
input('press any key to record:')
record(recorder)
input('recording... press any key to stop:')
stop(recorder)
data = getaudiodata(recorder)';

disp( ['extracted keys: ' extract2(std_decode2(data,1,6,0))] )