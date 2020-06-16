from behave import when, then, given
from behave.runner import Context

from spec.variables import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'environment')
@spec.behave_step
def environment(context: Context, *args, **kwargs):
    """
        environment
        \"""
        <json>
        \"""
        Defines environment hosts.

        "<id>": {
            "host": "<host>",
            "credentials": "<credentials>"
        }[,
        ...]

        :param json: JSON
        """
    kwargs['json'] = context.text
    invoke_step(context.e2e, context.spec['Variables'].environment, **kwargs)


@given(r'credentials')
@spec.behave_step
def credentials(context: Context, *args, **kwargs):
    """
        credentials
        \"""
        <json>
        \"""

        Defines credentials.

        "<id>": {
            "username": "<string>",
            "password": "<string>"
        }[,
        ...]

        :param json: JSON
        """
    kwargs['json'] = context.text
    invoke_step(context.e2e, context.spec['Variables'].credentials, **kwargs)


@given(r'selectors')
@spec.behave_step
def selectors(context: Context, *args, **kwargs):
    """
        credentials
        \"""
        <json>
        \"""
        Defines selectors.

        "<id>": "<xpath>"[,
        ...]

        :param json: JSON
        """
    kwargs['json'] = context.text
    invoke_step(context.e2e, context.spec['Variables'].selectors, **kwargs)


@given(r'variables')
@spec.behave_step
def variables(context: Context, *args, **kwargs):
    """
        variables
        \"""
        <json>
        \"""
        Defines variables.

        "<id>": "<value>"[,
        ...]
        """
    kwargs['json'] = context.text
    invoke_step(context.e2e, context.spec['Variables'].variables, **kwargs)


@given(r'([^\sa-zA-Z0-9])(?P<variable>(?:(?!\1).)*)(\1) value is ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)')
@spec.behave_step
def variable_value_is_value(context: Context, *args, **kwargs):
    """
        "<variable>" value is "<value>"

        * <variable> (required): variable name to store a value
        * <value> (required): the value of variable
        """
    invoke_step(context.e2e, context.spec['Variables'].variable_value_is_value, **kwargs)


@given(r'([^\sa-zA-Z0-9])(?P<variable>(?:(?!\1).)*)(\1) value is[:]?')
@spec.behave_step
def variable_value_is(context: Context, *args, **kwargs):
    """
        "<variable>" value is:
        \"""
        <value>
        \"""

        * <variable> (required): variable name to store a value
        * <value> (required): the value of variable
        """
    kwargs['value'] = context.text
    invoke_step(context.e2e, context.spec['Variables'].variable_value_is, **kwargs)


@given(r'([^\sa-zA-Z0-9])(?P<destination_variable>(?:(?!\1).)*)(\1) is a jsonpath selected value ([^\sa-zA-Z0-9])(?P<expression>(?:(?!\4).)*)(\4) from ([^\sa-zA-Z0-9])(?P<source_variable>(?:(?!\7).)*)(\7)')
@spec.behave_step
def destination_variable_is_a_jsonpath_selected_value_expression_from_source_variable(context: Context, *args, **kwargs):
    """
        "<destination_variable>" is a jsonpath selected value "<expression>" from "<source_variable>"

        * <destination_variable> (required): variable name to store a value
        * <expression> (required): the jsonpath expression to select a value
        * <source_variable> (required): variable name of an object to apply the jsonpath to

        JsonPath spec: https://github.com/json-path/JsonPath
        JsonPath online evaluator: https://jsonpath.herokuapp.com/
        """
    invoke_step(context.e2e, context.spec['Variables'].destination_variable_is_a_jsonpath_selected_value_expression_from_source_variable, **kwargs)


@then(r'the value of ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\1).)*)(\1) (?P<comparison>(should be empty)|(should not be empty)|(should be ([^\sa-zA-Z0-9])((?:(?!\8).)*)(\8))|(should not be ([^\sa-zA-Z0-9])((?:(?!\12).)*)(\12))|(should equal to ([^\sa-zA-Z0-9])((?:(?!\16).)*)(\16))|(should not equal to ([^\sa-zA-Z0-9])((?:(?!\20).)*)(\20))|(should be less than ([^\sa-zA-Z0-9])((?:(?!\24).)*)(\24))|(should be greater than ([^\sa-zA-Z0-9])((?:(?!\28).)*)(\28))|(should be less than or equal to ([^\sa-zA-Z0-9])((?:(?!\32).)*)(\32))|(should be greater than or equal to ([^\sa-zA-Z0-9])((?:(?!\36).)*)(\36))|(should be between ([^\sa-zA-Z0-9])((?:(?!\40).)*)(\40) and ([^\sa-zA-Z0-9])((?:(?!\43).)*)(\43))|(should contain ([^\sa-zA-Z0-9])((?:(?!\47).)*)(\47))|(should not contain ([^\sa-zA-Z0-9])((?:(?!\51).)*)(\51)))')
@spec.behave_step
def the_value_of_variable_comparison(context: Context, *args, **kwargs):
    """
        the value of "<variable>" <comparison>

        * <comparison> (required):
            * should be empty
            * should not be empty
            * should be "<value>"
            * should not be "<value>"
            * should equal to "<value>"
            * should not equal to "<value>"
            * should be less than "<value>"
            * should be greater than "<value>"
            * should be less than or equal to "<value>"
            * should be greater than or equal to "<value>"
            * should be between "<from value>" and "<to value>"
            * should contain "<value>"
            * should not contain "<value>"

        * <value>, <from value>, <to value>: expected value of the variable
        """
    invoke_step(context.e2e, context.spec['Variables'].the_value_of_variable_comparison, **kwargs)
