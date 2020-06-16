from behave import when, then, given
from behave.runner import Context

from spec.common import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@when(r'I wait for ([^\sa-zA-Z0-9])(?P<time>(?:(?!\1).)*)(\1) ([^\sa-zA-Z0-9])(?P<time_unit>seconds|minutes)(\4)')
@spec.behave_step
def i_wait_for_time_time_unit(context: Context, *args, **kwargs):
    """
        I wait for "<time>" "<time unit>"

        * <time> (required): the time period to wait
        * <time unit> (required): supported time units are: seconds, minutes
        """
    invoke_step(context.e2e, context.spec['Common'].i_wait_for_time_time_unit, **kwargs)
