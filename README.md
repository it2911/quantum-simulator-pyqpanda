# Quantum Simulator pyqpanda

[pyqpanda](https://github.com/OriginQ/QPanda-2) is created by [本源量子](http://www.originqc.com.cn/) company.

This repo for create pypanda container image.

You can easily test or use the pypanda simulator by command below.
```
$ docker pull it2911/pyqpanda:v3.6.4-stretch
v3.6.4-stretch: Pulling from it2911/pyqpanda
146bd6a88618: Already exists 
9935d0c62ace: Already exists 
db0efb86e806: Already exists 
e705a4c4fd31: Already exists 
c877b722db6f: Already exists 
ee96813ba647: Already exists 
225288af369e: Already exists 
92447bca47d7: Already exists 
f6bf6467e6fe: Already exists 
686ed18a8394: Already exists 
3b8ca536c09d: Already exists 
8cb458906333: Already exists 
Digest: sha256:a21ebc5706a7a11cb367c14fa26000d2f04622705851dba91da93d1f87542362
Status: Downloaded newer image for it2911/pyqpanda:v3.6.4-stretch
docker.io/it2911/pyqpanda:v3.6.4-stretch
$ docker run -it it2911/pyqpanda:v3.6.4-stretch bash
qpanda@d7346d710435:~$ tee test.py <<EOF
from pyqpanda import *

init(QMachineType.CPU)
prog = QProg()
q = qAlloc_many(2)
c = cAlloc_many(2)
prog.insert(H(q[0]))
prog.insert(CNOT(q[0],q[1]))
prog.insert(measure_all(q,c))
result = run_with_configuration(prog, cbit_list = c, shots = 1000)
print(result)
finalize()
EOF
qpanda@d7346d710435:~$ python test.py 
{'00': 498, '11': 502}
qpanda@d7346d710435:~$ exit
exit
``` 

If the `{'00': 498, '11': 502}` result is showed, means the container is rightly running on you server.

You have any question, please contact with cc8602@gmail.com