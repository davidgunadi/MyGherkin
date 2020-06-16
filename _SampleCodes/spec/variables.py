from typing import Dict

from util.spec import Spec, MultilineTextArgument, Argument, SubSentence, ChoiceSubSentenceArgument, \
    AnyTypeArgument, JsonObjectPreconditionArgument, JsonArrayPreconditionArgument, AnonymousBooleanArgument, \
    EnumArgument, PreconditionArgument

spec = Spec('Variables',
            imports="""
                from typing import Dict, Any, Optional
                from util.spec import SentenceMatch
            """)
given = spec.given
when = spec.when
then = spec.then


given(
    'quality bar version "<qb_version>"',
    args={
        'qb_version': Argument('quality bar version that this was checked against')
    },
    doc="""
        quality bar version "<qb_version>"

        * <qb_version> (required): quality bar version that this was checked against
        """
)


given(
    'environment',
    args={
        'environment': JsonObjectPreconditionArgument('')
    },
    doc="""
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
)


given(
    'environment ["<environment_id>"] from "<envds_url>"',
    args={
        'environment_id': PreconditionArgument('id of the environment to use'),
        'envds_url': PreconditionArgument('URL of the environment data structure'),
    },
    doc="""
        environment "<environment_id>" from "<envds_url>"

        * <environment_id> (optional): id of the environment to use
        * <envds_url> (required): URL of the environment data structure

        EnvDS spec: https://e2e.private.central-eks.aureacentral.com/api/spec.html
        """
)


given(
    'credentials',
    args={
        'credentials': JsonArrayPreconditionArgument('')
    },
    doc="""
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
)


given(
    'credentials "<cred_id>" [and "<cred2_id>" [and "<cred3_id>" [and "<cred4_id>" [and "<cred5_id>"]]]]',
    args={
        'cred_id': PreconditionArgument('ID of the credentials to use'),
        'cred2_id': PreconditionArgument('ID of the credentials to use'),
        'cred3_id': PreconditionArgument('ID of the credentials to use'),
        'cred4_id': PreconditionArgument('ID of the credentials to use'),
        'cred5_id': PreconditionArgument('ID of the credentials to use'),
    },
    doc="""
        credentials "<cred_id>" [and "<cred_id>" ...]

        * <cred_id> (required): ID of the credentials to use
        """
)


given(
    'selectors',
    args={
        'selectors': JsonObjectPreconditionArgument('')
    },
    doc="""
        selectors
        \"""
        <json>
        \"""
        Defines selectors.

        "<id>": "<xpath>"[,
        ...]

        :param json: JSON
        """
)


given(
    'variables',
    args={
        'variables': JsonObjectPreconditionArgument('')
    },
    doc="""
        variables
        \"""
        <json>
        \"""
        Defines variables.

        "<id>": "<value>"[,
        ...]
        """
)


given(
    '"<variable>" [default] value is "<value>"',
    args={
        'variable': Argument('variable name to store a value'),
        'default': AnonymousBooleanArgument('set default value'),
        'value': Argument('the value of variable')
    },
    doc="""
        "<variable>" [default] value is "<value>"

        * <variable> (required): variable name to store a value
        * <value> (required): the value of variable
        """
)

given(
    '"<variable>" [default] value is:',
    args={
        'variable': Argument('variable name to store a value'),
        'default': AnonymousBooleanArgument('set default value'),
        'value': MultilineTextArgument('the value of variable')
    },
    doc="""
        "<variable>" [default] value is:
        \"""
        <value>
        \"""

        * <variable> (required): variable name to store a value
        * <value> (required): the value of variable
        """
)

given(
    '"<destination_variable>" is a jsonpath selected value "<expression>" from "<source_variable>"',
    args={
        'destination_variable': Argument('variable name to store a value'),
        'expression': Argument('the jsonpath expression to select a value'),
        'source_variable': Argument('variable name of an object to apply the jsonpath to')
    },
    doc="""
        "<destination_variable>" is a jsonpath selected value "<expression>" from "<source_variable>"

        * <destination_variable> (required): variable name to store a value
        * <expression> (required): the jsonpath expression to select a value
        * <source_variable> (required): variable name of an object to apply the jsonpath to

        JsonPath spec: https://github.com/json-path/JsonPath
        JsonPath online evaluator: https://jsonpath.herokuapp.com/
        """
)


def assertion0(sentence: str):
    return SubSentence(sentence)


def assertion1(sentence: str):
    return SubSentence(sentence, args={'value': AnyTypeArgument('value to check against')})


def assertion2(sentence: str, args: Dict[str, AnyTypeArgument]):
    return SubSentence(sentence, args=args)


then(
    'the value of "<variable>" <comparison>',
    args={
        'variable': Argument('variable name to check', expand_variables=False),
        'comparison': ChoiceSubSentenceArgument(
            'one of comparisons',
            choices=[
                assertion0('should be empty'),
                assertion0('should not be empty'),
                assertion1('should be <value>'),
                assertion1('should not be <value>'),
                assertion1('should be equal to <value>'),
                assertion1('should not be equal to <value>'),
                assertion1('should be less than <value>'),
                assertion1('should be greater than <value>'),
                assertion1('should be less than or equal to <value>'),
                assertion1('should be greater than or equal to <value>'),
                assertion2(
                    'should be between <from value> and <to value>',
                    args={
                        'from value': AnyTypeArgument('minimum value, inclusive', 'from_value'),
                        'to value': AnyTypeArgument('maximum value, inclusive', 'to_value'),
                    }
                ),
                assertion1('should contain <value>'),
                assertion1('should not contain <value>'),
            ]
        )
    },
    doc="""
        the value of "<variable>" <comparison>

        * <comparison> (required):
            * should be empty
            * should not be empty
            * should be <value>
            * should not be <value>
            * should be equal to <value>
            * should not be equal to <value>
            * should be less than <value>
            * should be greater than <value>
            * should be less than or equal to <value>
            * should be greater than or equal to <value>
            * should be between <from value> and <to value>
            * should contain <value>
            * should not contain <value>
        * <value>, <from value>, <to value>: expected value of the variable. Allowed values:
            * "<string_value>" - a string value to compare with
            * <string_value> - an integer or float value to compare with (e.g. 123 or -123.45)
            * <boolean_value> - a boolean value to compare with. Can be true or false.
            * {<variable_name>} - a variable value to compare with (e.g.{environment.mainpage.URL})
        """
)

when(
    'I convert a variable "<variable>" content to "<function name>"',
    args={
        'variable': Argument('variable name needs to be updated'),
        'function name': EnumArgument('name of the function', ['lowercase', 'uppercase'], name='function_name')
    },
    doc="""
        'I convert a variable "<variable>" content to "<function name>'

        Updates value of a variable as per the specified function name

        *<variable> : name of the variable which has the value to be converted.
        *<function name>: For now, implement "lowercase" and "uppercase" functions

        """
)
