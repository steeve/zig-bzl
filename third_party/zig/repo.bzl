load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def repo():
    # REQUIRED FOR KVX
    new_git_repository(
        name = "zig",
        remote = "git@codeberg.org:ziglang/zig.git",
        commit = "24fdd5b7a4c1c8b5deb5b56756b9dbc8e08c86a8", # 0.16.0
        build_file = "//third_party/zig:zig.bazel",
        patch_args = ["-p1"],
        patches = [
            "//third_party/zig/patches:0.16.x/0001-ZML-kvx-add-support-for-LLVM-backend.patch",
            "//third_party/zig/patches:0.16.x/0002-ZML-sema-target-authorize-Zig-types-in-kvx-callconv.patch",
            "//third_party/zig/patches:0.16.x/0003-ZML-kvx-add-ClusterOS-target.patch",
            "//third_party/zig/patches:0.16.x/0004-ZML-kvx-add-addrspace-support.patch",
            "//third_party/zig/patches:0.16.x/0005-ZML-zig-enable-configurable-LLVM-Clang-and-LLVM-AR.patch",
            "//third_party/zig/patches:0.16.x/0006-ZML-zig-adapt-to-LLVM-OptBisect-API-change.patch",
        ],
    )

    # FOR TESTING MAIN
    # new_git_repository(
    #     name = "zig",
    #     remote = "git@codeberg.org:ziglang/zig.git",
    #     commit = "0606af509f9a7f5e6bc458940aa9529d73232fc4", # main
    #     build_file = "//third_party/zig:zig.bazel",
    #     patch_args = ["-p1"],
    #     patches = [
    #         # "//third_party/zig:patches/0001-ZML-kvx-add-support-for-LLVM-backend.patch",
    #         # "//third_party/zig:patches/0002-ZML-sema-target-authorize-Zig-types-in-kvx-callconv.patch",
    #         # "//third_party/zig:patches/0003-ZML-kvx-add-ClusterOS-target.patch",
    #         # "//third_party/zig:patches/0004-ZML-kvx-add-addrspace-support.patch",
    #         "//third_party/zig:patches/0005-ZML-zig-enable-configurable-LLVM-Clang-and-LLVM-AR.patch",
    #     ],
    # )
