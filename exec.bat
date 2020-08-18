docker build ./ -t rails:test
docker run -it --rm --name rails-test -v C:\Users\merut\Documents\sunaba\rails\static:/home/merutin -p 3000:3000 rails:test bash
