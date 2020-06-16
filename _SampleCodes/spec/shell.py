from driver.ShellDriver import ShellDriver

from util.spec import Spec, UseDriverArgument, InitDriverArgument, Argument, MultilineTextArgument, EnumArgument

spec = Spec('Shell',
            imports="""
                import sys
                from abc import abstractmethod
                from typing import Optional
                from driver.ShellDriver import ShellDriver
            """)
given = spec.given
when = spec.when
then = spec.then


def driver_arg():
    return UseDriverArgument('shell session to use, "shell" by default', ShellDriver)


given(
    'shell session to "<endpoint>" [using "<shell>"] [as "<shell driver instance id>"]',
    args={
        'endpoint': Argument('endpoint definition from environment to connect to'),
        'shell': Argument('"bash", getting from environment definition or "bash" by default'),
        'shell driver instance id':
            InitDriverArgument('a shortcut to this shell session, "shell" by default', ShellDriver),
    },
    doc="""
        shell session to "<endpoint>" [using "<shell>"] [as "<shell driver instance id>"]

        * <endpoint> (required): endpoint definition from environment to connect to
        * <shell> (optional): "bash", getting from environment definition or "bash" by default
        * <shell driver instance id> (optional): a shortcut to this shell session, "shell" by default
        """
)


when(
    'I execute command "<command>" [in "<shell driver instance id>"]',
    args={
        'command': Argument('shell commands to execute'),
        'shell driver instance id': driver_arg(),
    },
    doc="""
        I execute command "<command>" [in "<shell driver instance id>"]

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
)


when(
    'I execute script [in "<shell driver instance id>"]:',
    args={
        'shell driver instance id': driver_arg(),
        'script': MultilineTextArgument('shell commands to execute')
    },
    doc="""
        I execute script [in "<shell driver instance id>"]:
        \"""
        <script>
        \"""

        * <script> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
)


when(
    'I wait while "<command>" [in "<shell driver instance id>"] succeeds',
    args={
        'command': Argument('shell commands to execute'),
        'shell driver instance id': driver_arg(),
    },
    doc="""
        I wait while "<command>" [in "<shell driver instance id>"] succeeds

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
)


when(
    'I wait unless "<command>" [in "<shell driver instance id>"] succeeds',
    args={
        'command': Argument('shell commands to execute'),
        'shell driver instance id': driver_arg(),
    },
    doc="""
        I wait unless "<command>" [in "<shell driver instance id>"] succeeds

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
)


then(
    'commands [in "<shell driver instance id>"] should complete successfully',
    args={
        'shell driver instance id': driver_arg(),
    },
    doc="""
        commands [in "<shell driver instance id>"] should complete successfully

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
)


then(
    'exit status [in "<shell driver instance id>"] should be "<value>"',
    args={
        'shell driver instance id': driver_arg(),
        'value': Argument('command exit status to compare with'),
    },
    doc="""
        exit status [in "<shell driver instance id>"] should be "<value>"

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): command exit status to compare with
        """
)


then(
    'the output [in "<shell driver instance id>"] should be "<value>"',
    args={
        'shell driver instance id': driver_arg(),
        'value': Argument('exact value to compare output with', can_be_empty=True),
    },
    doc="""
        output [in "<shell driver instance id>"] should be "<value>"

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): exact value to compare output with
        """
)


then(
    '"<value>" should be in output [of "<shell driver instance id>"]',
    args={
        'value': Argument('string to find in commands execution output', can_be_empty=True),
        'shell driver instance id': driver_arg(),
    },
    doc="""
        "<value>" should be in output [of "<shell driver instance id>"]

        * <value> (required): string to find in commands execution output
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
)


then(
    'the output [in "<shell driver instance id>"] should be:',
    args={
        'shell driver instance id': driver_arg(),
        'value': MultilineTextArgument('exact value to compare output with')
    },
    doc="""
        the output [in "<shell driver instance id>"] should be:
        \"""
        <value>
        \"""

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): exact value to compare output with
        """
)


then(
    'I put the output [of "<shell driver instance id>"] into "<variable>" [as <type>]',
    args={
        'shell driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
        'type': EnumArgument('type of the variable', ['json'], 'as_type'),
    },
    doc="""
        I put the output [of "<shell driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <type> (optional>: "json"
        """
)


then(
    'I remember the output [of "<shell driver instance id>"] as "<variable>" [as <type>]',
    args={
        'shell driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
        'type': EnumArgument('type of the variable', ['json'], 'as_type'),
    },
    doc="""
        I remember the output [of "<shell driver instance id>"] as "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <type> (optional>: "json"
        """
)
