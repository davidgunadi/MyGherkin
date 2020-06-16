from behave import when, then, given
from behave.runner import Context

from spec.curl import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'HTTP request(?: as ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))?')
@spec.behave_step
def http_request_as_driver(context: Context, *args, **kwargs):
    """
        HTTP request [as "<http driver instance id>"]

        * <http driver instance id> (optional): a shortcut to this HTTP request, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Http'].http_request_as_driver, **kwargs)


@when(r'I set header ([^\sa-zA-Z0-9])(?P<header>(?:(?!\1).)*)(\1) to ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_set_header_header_to_value_in_driver(context: Context, *args, **kwargs):
    """
        I set header "<header>" to "<value>" [in "<http driver instance id>"]

        * <header> (required): header name
        * <value> (required): value of header
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Http'].i_set_header_header_to_value_in_driver, **kwargs)


@when(r'I set body to ([^\sa-zA-Z0-9])(?P<value>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_set_body_to_value_in_driver(context: Context, *args, **kwargs):
    """
        I set body to "<value>" [in "<http driver instance id>"]

        * <value> (required): value for request body
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Http'].i_set_body_to_value_in_driver, **kwargs)


@when(r'I set body(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? to[:]?')
@spec.behave_step
def i_set_body_in_driver_to(context: Context, *args, **kwargs):
    """
        I set body [in "<http driver instance id>"] to:

        \"""
        <value>
        \"""

        * <value> (required): value for request body
        * <http driver instance id> (optional): request object to use, "http" by default
        """
    kwargs['value'] = context.text
    invoke_step(context.e2e, context.spec['Http'].i_set_body_in_driver_to, **kwargs)


@when(r'I execute (?P<method>GET|POST|PUT|DELETE|HEAD|OPTIONS) request for ([^\sa-zA-Z0-9])(?P<url>(?:(?!\2).)*)(\2)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\5).)*)(\5))?')
@spec.behave_step
def i_execute_method_request_for_url_in_driver(context: Context, *args, **kwargs):
    """
        I execute <method> request for "<URL>" [in "<http driver instance id>"]

        * <method> (required): "GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS"
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Http'].i_execute_method_request_for_url_in_driver, **kwargs)


@then(r'request(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should complete successfully')
@spec.behave_step
def request_in_driver_should_complete_successfully(context: Context, *args, **kwargs):
    """
        request [in "<http driver instance id>"] should complete successfully

        * <http driver instance id> (optional): request object to use, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Http'].request_in_driver_should_complete_successfully, **kwargs)


@then(r'response status(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should be ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)')
@spec.behave_step
def response_status_in_driver_should_be_value(context: Context, *args, **kwargs):
    """
        response status [in "<http driver instance id>"] should be "<value>"

        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): numeric HTTP status to compare with
        """
    invoke_step(context.e2e, context.spec['Http'].response_status_in_driver_should_be_value, **kwargs)


@then(r'response header ([^\sa-zA-Z0-9])(?P<header>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))? should be ([^\sa-zA-Z0-9])(?P<value>(?:(?!\7).)*)(\7)')
@spec.behave_step
def response_header_header_in_driver_should_be_value(context: Context, *args, **kwargs):
    """
        response header "<header>" [in "<http driver instance id>"] should be "<value>"

        * <header> (required): header name
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): exact value to compare output with
        """
    invoke_step(context.e2e, context.spec['Http'].response_header_header_in_driver_should_be_value, **kwargs)


@then(r'response body(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should be ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)')
@spec.behave_step
def response_body_in_driver_should_be_value(context: Context, *args, **kwargs):
    """
        response body [in "<http driver instance id>"] should be "<value>"

        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): exact value to compare output with
        """
    invoke_step(context.e2e, context.spec['Http'].response_body_in_driver_should_be_value, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<value>(?:(?!\1).)*)(\1) should be in response body(?: of ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def value_should_be_in_response_body_of_driver(context: Context, *args, **kwargs):
    """
        "<value>" should be in response body [of "<http driver instance id>"]

        * <value> (required): string to find in commands execution output
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
    invoke_step(context.e2e, context.spec['Http'].value_should_be_in_response_body_of_driver, **kwargs)


@then(r'I put the response(?: of ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? into ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\4).)*)(\4)(?: as (?P<as_type>json))?')
@spec.behave_step
def i_put_the_response_of_driver_into_variable_as_as_type(context: Context, *args, **kwargs):
    """
        I put the response [of "<http driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <type> (optional): "json"
        """
    invoke_step(context.e2e, context.spec['Http'].i_put_the_response_of_driver_into_variable_as_as_type, **kwargs)
