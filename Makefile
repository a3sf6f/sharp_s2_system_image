MKIMG = contrib/make_ext4fs

CURRENT_COMMIT_HASH != git rev-parse --short HEAD
OUTPUT_IMAGE = system_$(CURRENT_COMMIT_HASH).sparseimg


image: fs_config file_contexts
	$(MKIMG) -s -l 3758096384 -L system -a / -C fs_config -S file_contexts $(OUTPUT_IMAGE) root

all: test

test: image
	@echo "\nRunning test will require ROOT PERMISSION to mount/umount image.\n"
	test/test_same_perms_caps_labels_stock80.sh $(OUTPUT_IMAGE)

file_contexts: etc/nonplat_file_contexts root/system/etc/selinux/plat_file_contexts
	cat root/system/etc/selinux/plat_file_contexts etc/nonplat_file_contexts > file_contexts

fs_config:
	bin/generate_fs_config.sh root > fs_config

clean:
	rm -f *.sparseimg file_contexts fs_config
