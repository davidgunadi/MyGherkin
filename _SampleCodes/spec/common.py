from util.spec import Spec, Argument, EnumArgument, MultilineTextArgument

spec = Spec('Common')
given = spec.given
when = spec.when
then = spec.then

when(
    'I wait for "<time>" <time unit>',
    args={
        'time': Argument("the time period to wait"),
        'time unit': EnumArgument("supported time units are: seconds, minutes", ['seconds', 'minutes'], 'time_unit'),
    },
    doc="""
        I wait for "<time>" <time unit>

        * <time> (required): the time period to wait
        * <time unit> (required): supported time units are: seconds, minutes
        """
)


when(
    'I execute an action which only human can execute:',
    manual_execution=True,
    args={
        'value': MultilineTextArgument("any text for human action"),
    },
    doc="""
        I execute an action which only human can execute:
        \"""
        <value>
        \"""
        NB: there is no way to handle captcha automatically, automatic execution will always fail
        and scenario should be marked for manual testing explicitly
        The reason this has been added is MOAFCID-41579
        * <value> (required): any text for human action
        """
)


then(
    'I should verify what only human can verify:',
    manual_execution=True,
    args={
        'value': MultilineTextArgument("any text for human action"),
    },
    doc="""
        I should verify what only human can verify:
        \"""
        <value>
        \"""
        NB: there is no way to handle captcha automatically, automatic execution will always fail
        and scenario should be marked for manual testing explicitly
        The reason this has been added is MOAFCID-41579
        * <value> (required): any text for human expectation
        """
)
