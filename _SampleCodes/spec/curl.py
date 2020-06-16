from driver.CurlDriver import CurlDriver
from util.spec import Spec, Argument, UseDriverArgument, InitDriverArgument, MultilineTextArgument, \
    EnumArgument, AnonymousBooleanArgument

spec = Spec('HTTP',
            spec_id='Http',
            imports="""
                from typing import Optional
                from driver.CurlDriver import CurlDriver
            """
            )
given = spec.given
when = spec.when
then = spec.then


def driver_arg():
    return UseDriverArgument('request object to use, "curl" by default', CurlDriver)


given(
    'HTTP request [as "<http driver instance id>"]',
    args={
        'http driver instance id': InitDriverArgument('a shortcut to this HTTP request, "curl" by default', CurlDriver),
    },
    doc="""
        HTTP request [as "<http driver instance id>"]

        * <http driver instance id> (optional): a shortcut to this HTTP request, "curl" by default
        """
)


when(
    'I set header "<header>" to "<value>" [in "<http driver instance id>"]',
    args={
        'header': Argument('header name'),
        'value': Argument('value of header', can_be_empty=True),
        'http driver instance id': driver_arg(),
    },
    doc="""
        I set header "<header>" to "<value>" [in "<http driver instance id>"]

        * <header> (required): header name
        * <value> (required): value of header
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
)

when(
    'I set [pre-encoded] query param "<key>" to "<value>" [in "<http driver instance id>"]',
    args={
        'pre-encoded': AnonymousBooleanArgument('a flag to disable url encoding', name='pre_encoded'),
        'key': Argument('key'),
        'value': Argument('value of param', can_be_empty=True),
        'http driver instance id': driver_arg(),
    },
    doc="""
        I set query param "<key>" to "<value>" [in "<http driver instance id>"]

        * <pre-encoded>: a flag to disable url encoding
        * <key> (required): name of query param
        * <value> (required): value of query param
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
)


when(
    'I set body to "<value>" [in "<http driver instance id>"]',
    args={
        'value': Argument('value for request body', can_be_empty=True),
        'http driver instance id': driver_arg(),
    },
    doc="""
        I set body to "<value>" [in "<http driver instance id>"]

        * <value> (required): value for request body
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
)


when(
    'I set body [in "<http driver instance id>"] to:',
    args={
        'http driver instance id': driver_arg(),
        'value': MultilineTextArgument('value for request body')
    },
    doc="""
        I set body [in "<http driver instance id>"] to:

        \"""
        <value>
        \"""

        * <value> (required): value for request body
        * <http driver instance id> (optional): request object to use, "http" by default
        """
)


when(
    'I execute <method> request for "<URL>" [in "<http driver instance id>"]',
    args={
        'method': EnumArgument('HTTP method', ['GET', 'POST', 'PUT', 'DELETE', 'HEAD', 'OPTIONS', 'PATCH']),
        'URL': Argument('url to use', name='url'),
        'http driver instance id': driver_arg(),
    },
    doc="""
        I execute <method> request for "<URL>" [in "<http driver instance id>"]

        * <method> (required): "GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS"
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
)


then(
    'request [in "<http driver instance id>"] should complete successfully',
    args={
        'http driver instance id': driver_arg(),
    },
    doc="""
        request [in "<http driver instance id>"] should complete successfully

        * <http driver instance id> (optional): request object to use, "curl" by default
        """
)


then(
    'response status [in "<http driver instance id>"] should be "<value>"',
    args={
        'http driver instance id': driver_arg(),
        'value': Argument('numeric HTTP status to compare with', can_be_empty=True),
    },
    doc="""
        response status [in "<http driver instance id>"] should be "<value>"

        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): numeric HTTP status to compare with
        """
)


then(
    'response header "<header>" [in "<http driver instance id>"] should be "<value>"',
    args={
        'header': Argument('header name'),
        'http driver instance id': driver_arg(),
        'value': Argument('exact value to compare output with', can_be_empty=True),
    },
    doc="""
        response header "<header>" [in "<http driver instance id>"] should be "<value>"

        * <header> (required): header name
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): exact value to compare output with
        """
)


then(
    'response body [in "<http driver instance id>"] should be "<value>"',
    args={
        'http driver instance id': driver_arg(),
        'value': Argument('exact value to compare output with', can_be_empty=True),
    },
    doc="""
        response body [in "<http driver instance id>"] should be "<value>"

        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): exact value to compare output with
        """
)


then(
    '"<value>" should be in response body [of "<http driver instance id>"]',
    args={
        'value': Argument('string to find in commands execution output', can_be_empty=True),
        'http driver instance id': driver_arg(),
    },
    doc="""
        "<value>" should be in response body [of "<http driver instance id>"]

        * <value> (required): string to find in commands execution output
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
)


then(
    'I put the response [of "<http driver instance id>"] into "<variable>" [as <type>]',
    args={
        'http driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
        'type': EnumArgument('type of the variable', ['json'], 'as_type'),
    },
    doc="""
        I put the response [of "<http driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <type> (optional): "json"
        """
)

then(
    'I remember the response [of "<http driver instance id>"] as "<variable>" [as <type>]',
    args={
        'http driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
        'type': EnumArgument('type of the variable', ['json'], 'as_type'),
    },
    doc="""
        I remember the response [of "<http driver instance id>"] as "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <type> (optional): "json"
        """
)
