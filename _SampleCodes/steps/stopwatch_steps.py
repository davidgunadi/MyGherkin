from behave import when, then, given
from behave.runner import Context

from spec.stopwatch import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'a stopwatch ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1)')
@spec.behave_step
def a_stopwatch_driver(context: Context, *args, **kwargs):
    """
        a stopwatch "<stopwatch driver id>"

        * <stopwatch driver id> (required): a shortcut to this HTTP request, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Stopwatch'].a_stopwatch_driver, **kwargs)


@when(r'I (?P<action>start|stop|reset) the stopwatch(?: ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\2).)*)(\2))?')
@spec.behave_step
def i_action_the_stopwatch_driver(context: Context, *args, **kwargs):
    """
        I <action> the stopwatch ["<stopwatch driver id>"]

        * <action> (required): "start", "stop", "reset"
        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        """
    invoke_step(context.e2e, context.spec['Stopwatch'].i_action_the_stopwatch_driver, **kwargs)


@then(r'the stopwatch(?: ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? value should be ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4) (?P<time_unit>min|sec|ms) or less')
@spec.behave_step
def the_stopwatch_driver_value_should_be_value_time_unit_or_less(context: Context, *args, **kwargs):
    """
        the stopwatch ["<stopwatch driver id>"] value should be "<value>" <time-unit> or less

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <value> (required): numeric value
        * <time-unit> (required): "min", "sec", "ms"
        """
    invoke_step(context.e2e, context.spec['Stopwatch'].the_stopwatch_driver_value_should_be_value_time_unit_or_less, **kwargs)


@then(r'I put elapsed time of the stopwatch(?: ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? into ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\4).)*)(\4)')
@spec.behave_step
def i_put_elapsed_time_of_the_stopwatch_driver_into_variable(context: Context, *args, **kwargs):
    """
        I put elapsed time of the stopwatch "<stopwatch driver id>" into "<variable>"

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <variable> (required): variable name to put elapsed stopwatch time value
        """
    invoke_step(context.e2e, context.spec['Stopwatch'].i_put_elapsed_time_of_the_stopwatch_driver_into_variable, **kwargs)
