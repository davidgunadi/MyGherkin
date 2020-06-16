from behave import when, then, given
from behave.runner import Context

from spec.scenario import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@when(r'I execute scenario ([^\sa-zA-Z0-9])(?P<scenario>(?:(?!\1).)*)(\1)')
@spec.behave_step
def i_execute_scenario_scenario(context: Context, *args, **kwargs):
    """
        I execute scenario "<scenario>"

        * <scenario> (required): Jira issue key for End-to-end Test ticket to execute
        """
    invoke_step(context.e2e, context.spec['Scenario'].i_execute_scenario_scenario, **kwargs)


@then(r'scenario steps should complete successfully')
@spec.behave_step
def scenario_steps_should_complete_successfully(context: Context, *args, **kwargs):
    """
        scenario steps should complete successfully
        """
    invoke_step(context.e2e, context.spec['Scenario'].scenario_steps_should_complete_successfully, **kwargs)
