from util.spec import Spec, Argument

spec = Spec(
    'Scenario',
    imports="""
        from typing import Optional
    """
)
given = spec.given
when = spec.when
then = spec.then


when(
    'I use "<variable>" [with value "<value>"] as an input parameter',
    args={
        'variable': Argument('input parameter name'),
        'value': Argument('parameter value, defaults to the value of <variable> in the current scenario'),
    },
    doc="""
        I use "<variable>" [with value "<value>"] as an input parameter

        * <variable> (required) input parameter name
        * <value> (optional) parameter value, defaults to the value of <variable> in the current scenario
        """
)


when(
    'I expect "<variable>" to be an output parameter',
    args={
        'variable': Argument('output parameter name'),
    },
    doc="""
        I expect "<variable>" to be an output parameter

        * <variable> (required) output parameter name
        """
)


when(
    'I execute scenario "<scenario>"',
    args={
        'scenario': Argument('Jira issue key for End-to-end Test ticket to execute'),
    },
    doc="""
        I execute scenario "<scenario>"

        * <scenario> (required): Jira issue key for End-to-end Test ticket to execute
        """
)


then(
    'scenario steps should complete successfully',
    doc="""
        scenario steps should complete successfully
        """
)
