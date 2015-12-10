# docker-yumrepo

nginx serving one or multiple Yum repositories.

## Usage

The rpms are not embedded into the image and instead a host volume is used.
This allows for a more portable image, and also to (re)generate repositories
on the fly.

Repositories are stored in `/var/repo` and if multiple repositories are used
they have to be passed as a comma-separated list in the `REPOS` environment
variable.

    docker run -d --name yumrepo -p 80:80 \
	-e REPOS="project1/x86_64,project2/x86_64" -v $PWD/repo:/var/repo \
	jasperla/yumrepo

New repositories can be added by copying them into `$PWD/repo/` and breaking
into the container:

    docker exec -ti yumrepo createrepo /var/repo/project3

## Copyright

2015 Jasper Lievisse Adriaanse <j@jasper.la>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
