from behave import when, then, given
from behave.runner import Context

from spec.sql import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'DB(?: ([^\sa-zA-Z0-9])(?P<db_type>(?:(?!\1).)*)(\1))?(?: ([^\sa-zA-Z0-9])(?P<version>(?:(?!\4).)*)(\4))? connection to ([^\sa-zA-Z0-9])(?P<envhost>(?:(?!\7).)*)(\7)(?: as ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\10).)*)(\10))?')
@spec.behave_step
def db_db_type_version_connection_to_envhost_as_driver(context: Context, *args, **kwargs):
    """
        DB ["<type>"] ["<version>"] connection to "<envhost>" [as "<db driver instance id>"]

        * <type> (optional): MySQL, SQL Server, PostgreSQL, etc., type from environment by default
        * <version> (optional): exact client library version to use, version from environment by default
        * <envhost> (required): host definition from environment to connect to
        * <db driver instance id> (optional): a shortcut to this connection, "db" by default
        """
    invoke_step(context.e2e, context.spec['Sql'].db_db_type_version_connection_to_envhost_as_driver, **kwargs)


@when(r'I execute query ([^\sa-zA-Z0-9])(?P<query>(?:(?!\1).)*)(\1)(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_execute_query_query_on_driver(context: Context, *args, **kwargs):
    """
        I execute query "<query>" [on "<db driver instance id>"]

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
    invoke_step(context.e2e, context.spec['Sql'].i_execute_query_query_on_driver, **kwargs)


@when(r'I wait while ([^\sa-zA-Z0-9])(?P<query>(?:(?!\1).)*)(\1)(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))? returns empty set')
@spec.behave_step
def i_wait_while_query_on_driver_returns_empty_set(context: Context, *args, **kwargs):
    """
        I wait while "<query>" [on "<db driver instance id>"] returns empty set

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
    invoke_step(context.e2e, context.spec['Sql'].i_wait_while_query_on_driver_returns_empty_set, **kwargs)


@when(r'I wait unless ([^\sa-zA-Z0-9])(?P<query>(?:(?!\1).)*)(\1)(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))? returns empty set')
@spec.behave_step
def i_wait_unless_query_on_driver_returns_empty_set(context: Context, *args, **kwargs):
    """
        I wait unless "<query>" [on "<db driver instance id>"] returns empty set

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
    invoke_step(context.e2e, context.spec['Sql'].i_wait_unless_query_on_driver_returns_empty_set, **kwargs)


@then(r'queries(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should complete successfully')
@spec.behave_step
def queries_on_driver_should_complete_successfully(context: Context, *args, **kwargs):
    """
        queries [on "<db driver instance id>"] should complete successfully

        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
    invoke_step(context.e2e, context.spec['Sql'].queries_on_driver_should_complete_successfully, **kwargs)


@then(r'result set(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should be ([^\sa-zA-Z0-9])(?P<results>(?:(?!\4).)*)(\4)')
@spec.behave_step
def result_set_on_driver_should_be_results(context: Context, *args, **kwargs):
    """
        result set [on "<db driver instance id>"] should be "<results>"

        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <results> (required): referenced result set table - fixme: needs to be defined somehow
        """
    invoke_step(context.e2e, context.spec['Sql'].result_set_on_driver_should_be_results, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<value>(?:(?!\1).)*)(\1) should be in output(?: from ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def value_should_be_in_output_from_driver(context: Context, *args, **kwargs):
    """
        "<value>" should be in output [from "<db driver instance id>"]

        * <value> (required): string to find in query result
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
    invoke_step(context.e2e, context.spec['Sql'].value_should_be_in_output_from_driver, **kwargs)


@then(r'I put the result set(?: from ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? into ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\4).)*)(\4)(?: as (?P<as_type>json))?')
@spec.behave_step
def i_put_the_result_set_from_driver_into_variable_as_as_type(context: Context, *args, **kwargs):
    """
        I put the result set [from "<db driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <type> (optional): "json"
        """
    invoke_step(context.e2e, context.spec['Sql'].i_put_the_result_set_from_driver_into_variable_as_as_type, **kwargs)
