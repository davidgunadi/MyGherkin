from behave import when, then, given
from behave.runner import Context

from spec.shell import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'shell session to ([^\sa-zA-Z0-9])(?P<envhost>(?:(?!\1).)*)(\1)(?: using ([^\sa-zA-Z0-9])(?P<shell>(?:(?!\4).)*)(\4))?(?: as ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def shell_session_to_envhost_using_shell_as_driver(context: Context, *args, **kwargs):
    """
        shell session to "<envhost>" [using "<shell>"] [as "<shell driver instance id>"]

        * <envhost> (required): host definition from environment to connect to
        * <shell> (optional): "bash", getting from environment definition or "bash" by default
        * <shell driver instance id> (optional): a shortcut to this shell session, "shell" by default
        """
    invoke_step(context.e2e, context.spec['Shell'].shell_session_to_envhost_using_shell_as_driver, **kwargs)


@when(r'I execute command ([^\sa-zA-Z0-9])(?P<command>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_execute_command_command_in_driver(context: Context, *args, **kwargs):
    """
        I execute command "<command>" [in "<shell driver instance id>"]

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
    invoke_step(context.e2e, context.spec['Shell'].i_execute_command_command_in_driver, **kwargs)


@when(r'I execute script(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))?[:]?')
@spec.behave_step
def i_execute_script_in_driver(context: Context, *args, **kwargs):
    """
        I execute script [in "<shell driver instance id>"]:
        \"""
        <script>
        \"""

        * <script> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
    kwargs['script'] = context.text
    invoke_step(context.e2e, context.spec['Shell'].i_execute_script_in_driver, **kwargs)


@when(r'I wait while ([^\sa-zA-Z0-9])(?P<command>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))? succeeds')
@spec.behave_step
def i_wait_while_command_in_driver_succeeds(context: Context, *args, **kwargs):
    """
        I wait while "<command>" [in "<shell driver instance id>"] succeeds

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
    invoke_step(context.e2e, context.spec['Shell'].i_wait_while_command_in_driver_succeeds, **kwargs)


@when(r'I wait unless ([^\sa-zA-Z0-9])(?P<command>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))? succeeds')
@spec.behave_step
def i_wait_unless_command_in_driver_succeeds(context: Context, *args, **kwargs):
    """
        I wait unless "<command>" [in "<shell driver instance id>"] succeeds

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
    invoke_step(context.e2e, context.spec['Shell'].i_wait_unless_command_in_driver_succeeds, **kwargs)


@then(r'commands(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should complete successfully')
@spec.behave_step
def commands_in_driver_should_complete_successfully(context: Context, *args, **kwargs):
    """
        commands [in "<shell driver instance id>"] should complete successfully

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
    invoke_step(context.e2e, context.spec['Shell'].commands_in_driver_should_complete_successfully, **kwargs)


@then(r'exit status(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should be ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)')
@spec.behave_step
def exit_status_in_driver_should_be_value(context: Context, *args, **kwargs):
    """
        exit status [in "<shell driver instance id>"] should be "<value>"

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): command exit status to compare with
        """
    invoke_step(context.e2e, context.spec['Shell'].exit_status_in_driver_should_be_value, **kwargs)


@then(r'the output(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should be ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)')
@spec.behave_step
def the_output_in_driver_should_be_value(context: Context, *args, **kwargs):
    """
        output [in "<shell driver instance id>"] should be "<value>"

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): exact value to compare output with
        """
    invoke_step(context.e2e, context.spec['Shell'].the_output_in_driver_should_be_value, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<value>(?:(?!\1).)*)(\1) should be in output(?: of ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def value_should_be_in_output_of_driver(context: Context, *args, **kwargs):
    """
        "<value>" should be in output [of "<shell driver instance id>"]

        * <value> (required): string to find in commands execution output
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
    invoke_step(context.e2e, context.spec['Shell'].value_should_be_in_output_of_driver, **kwargs)


@then(r'the output(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should be[:]?')
@spec.behave_step
def the_output_in_driver_should_be(context: Context, *args, **kwargs):
    """
        the output [in "<shell driver instance id>"] should be:
        \"""
        <value>
        \"""

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): exact value to compare output with
        """
    kwargs['value'] = context.text
    invoke_step(context.e2e, context.spec['Shell'].the_output_in_driver_should_be, **kwargs)


@then(r'I put the output(?: of ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? into ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\4).)*)(\4)(?: as (?P<as_type>json))?')
@spec.behave_step
def i_put_the_output_of_driver_into_variable_as_as_type(context: Context, *args, **kwargs):
    """
        I put the output [of "<shell driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <type> (optional>: "json"
        """
    invoke_step(context.e2e, context.spec['Shell'].i_put_the_output_of_driver_into_variable_as_as_type, **kwargs)
