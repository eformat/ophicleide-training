FROM radanalyticsio/openshift-spark

USER root

ADD requirements.txt /opt/ophicleide/
ADD wheel-requirements.txt /opt/ophicleide/

WORKDIR /opt/ophicleide

RUN yum install -y python-pip \
 && pip install -r requirements.txt \
 && pip wheel -r wheel-requirements.txt -w . \
 && mv pymongo*.whl pymongo.zip

ADD . /opt/ophicleide

USER 185

CMD ./run.sh
