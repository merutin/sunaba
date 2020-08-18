docker build ./ -t rails:test
set current=%~dp0
docker run -it --rm --name rails-test -v %current%:/home/rails -p 3000:3000 rails:test bash
