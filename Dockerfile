# syntax=docker/dockerfile:1
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
# WORKDIR /workspace

# Update
RUN apt-get update

# Install Jupyter and other maths related libraries
RUN pip install \
    h5py \
    ipykernel>=6.0.0 \
    notebook \
    numpy \
    pandas \
    scipy \
    seaborn


# Install Dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# Run Jupyter Notebook
CMD [ "jupyter", "notebook", "--port=8888", "--no-browser",\
    "--ip=0.0.0.0", "--allow-root"]

EXPOSE 8888