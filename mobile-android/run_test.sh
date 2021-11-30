#!/bin/bash
set -e

#sh gradlew jacocoTestReport
sh gradlew jacocoTestReport
open app/build/reports/jacoco/jacocoTestReport/html/index.html

echo "Build Data Done !!!"