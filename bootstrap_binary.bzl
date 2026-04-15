load("@bazel_lib//lib:copy_file.bzl", "COPY_FILE_TOOLCHAINS", "copy_file_action")
load("@bazel_lib//lib:copy_to_directory.bzl", "copy_to_directory_bin_action")

def _bootstrap_transition_impl(_settings, attr):
    return {
        "@rules_zig//zig/settings:use_cc_common_link": False,
        "//:from_source": False,
    }

bootstrap_transition = transition(
    implementation = _bootstrap_transition_impl,
    inputs = [],
    outputs = [
        "//:from_source",
        "@rules_zig//zig/settings:use_cc_common_link",
    ],
)

def _bootstrap_binary_impl(ctx):
    actual = ctx.attr.actual[DefaultInfo]
    exe = actual.files_to_run.executable

    out = ctx.actions.declare_file(ctx.label.name)

    if ctx.attr.symlink:
        ctx.actions.symlink(
            output = out,
            target_file = exe,
        )
    else:
        copy_file_action(ctx, exe, out)

    return [
        DefaultInfo(
            files = depset([out]),
            executable = out,
            runfiles = actual.default_runfiles,
        ),
    ]

bootstrap_binary = rule(
    implementation = _bootstrap_binary_impl,
    executable = True,
    attrs = {
        "actual": attr.label(
            cfg = "exec",
            allow_single_file = True,
            mandatory = True,
        ),
        "symlink": attr.bool(
            default = True,
            doc = "If set to False, will copy the tool instead of symlinking",
        ),
    },
    cfg = bootstrap_transition,
    toolchains = COPY_FILE_TOOLCHAINS,
)
