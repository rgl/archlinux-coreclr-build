all: archlinux-coreclr-build

archlinux-coreclr-build: archlinux-docker-image
	docker build -t archlinux-coreclr-build .

archlinux-docker-image:
	test -n "$(shell docker images -q archlinux)" || sudo ./mkimage-arch.sh

clean:
	test -z "$(shell docker images -q archlinux-coreclr-build)" || docker rmi archlinux-coreclr-build
	test -z "$(shell docker images -q archlinux)" || docker rmi archlinux

.PHONY: all archlinux-coreclr-build archlinux-docker-image
