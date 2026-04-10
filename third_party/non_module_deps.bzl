load("//third_party/llvm-project:repo.bzl", llvm_project = "repo")
load("//third_party/zig:repo.bzl", zig = "repo")

def _non_module_deps_impl(mctx):
    llvm_project()
    zig()

    return mctx.extension_metadata(
        reproducible = True,
        root_module_direct_deps = "all",
        root_module_direct_dev_deps = [],
    )

non_module_deps = module_extension(
    implementation = _non_module_deps_impl,
)
