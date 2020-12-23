FROM continuumio/miniconda3

RUN pip install jupyter_http_over_ws
RUN jupyter serverextension enable --py jupyter_http_over_ws
RUN conda install xeus-cling -c conda-forge
RUN apt-get update && apt-get install build-essential -y

ENTRYPOINT jupyter notebook \
  --NotebookApp.allow_origin='https://colab.research.google.com' \
  --port=8888 \
  --NotebookApp.ip='0.0.0.0' \
  --NotebookApp.port_retries=0 \
  --allow-root