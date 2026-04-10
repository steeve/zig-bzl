load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def repo():
    new_git_repository(
        name = "zig",
        remote = "git@codeberg.org:ziglang/zig.git",
        commit = "3edaef9e011ac500f66c9ee0ba3ea24be905bcde",
        build_file = "//third_party/zig:zig.bazel",
        patch_args = ["-p1"],
        patches = [
            "//third_party/zig:patches/0001-ZML-kvx-add-support-for-LLVM-backend.patch",
            "//third_party/zig:patches/0002-ZML-sema-target-authorize-Zig-types-in-kvx-callconv.patch",
            "//third_party/zig:patches/0003-ZML-kvx-add-ClusterOS-target.patch",
            "//third_party/zig:patches/0004-ZML-kvx-add-addrspace-support.patch",
            "//third_party/zig:patches/0005-ZML-zig-enable-configurable-LLVM-Clang-and-LLVM-AR.patch",
        ],
    )
