FROM ctfhub/base_misc_socat_python_36

ENV COMMAND=./app.py

COPY src/app.py /home/ctf/app.py
