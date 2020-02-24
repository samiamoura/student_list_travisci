IMAGE = samiamr/student-list-api:travis-ci

image:
	docker build -t $(IMAGE) ./simple_api

run:
	docker run -d --name=student-list-api -p 5000:5000 -v ${PWD}/simple_api/student_age.json:/data/student_age.json $(IMAGE)
	# To let the container start before run test
	sleep 5
test:
	if [ "$$(curl -u toto:python -X GET http://localhost:5000/pozos/api/v1.0/get_student_ages | python -c "import sys, json; print json.load(sys.stdin)['student_ages']['bob']")" = "13" ] && [ "$$(curl -u toto:python -X GET http://localhost:5000/pozos/api/v1.0/get_student_ages | python -c "import sys, json; print json.load(sys.stdin)['student_ages']['alice']")" = "12" ]; then echo "test OK"; exit 0; else echo "test KO"; exit 1; fi

clean:
	docker rm -vf  student-list-api

push-image:
	docker push $(IMAGE)

.PHONY: image run test clean push-image
