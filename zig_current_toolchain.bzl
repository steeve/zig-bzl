def _zig_current_toolchain_impl(ctx):
    toolchain_info = ctx.toolchains["@rules_zig//zig:toolchain_type"]
    return [
        DefaultInfo(
            files = toolchain_info.zigtoolchaininfo.zig_exe.files,
        ),
    ]

# Copied from java_toolchain_alias
# https://cs.opensource.google/bazel/bazel/+/master:tools/jdk/java_toolchain_alias.bzl
zig_current_toolchain = rule(
    implementation = _zig_current_toolchain_impl,
    toolchains = ["@rules_zig//zig:toolchain_type"],
)
