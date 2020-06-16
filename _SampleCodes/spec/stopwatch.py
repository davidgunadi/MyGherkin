from driver.StopwatchDriver import StopwatchDriver
from util.spec import Spec, UseDriverArgument, InitDriverArgument, EnumArgument, Argument

spec = Spec('Stopwatch',
            imports="""
                from driver.StopwatchDriver import StopwatchDriver
            """)
given = spec.given
when = spec.when
then = spec.then


def driver_arg():
    return UseDriverArgument('driver id, "stopwatch" by default', StopwatchDriver)


given(
    'a stopwatch "<stopwatch driver id>"',
    args={
        'stopwatch driver id':
            InitDriverArgument('a shortcut to this HTTP request, "curl" by default', StopwatchDriver),
    },
    doc="""
        a stopwatch "<stopwatch driver id>"

        A stopwatch driver with driver id "stopwatch" is available by default
        * <stopwatch driver id> (required): driver id
        """
)


when(
    'I <action> the stopwatch ["<stopwatch driver id>"]',
    args={
        'action': EnumArgument('', ['start', 'stop', 'reset']),
        'stopwatch driver id': driver_arg(),
    },
    doc="""
        I <action> the stopwatch ["<stopwatch driver id>"]

        * <action> (required): "start", "stop", "reset"
        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        """
)


then(
    'the stopwatch ["<stopwatch driver id>"] value should be "<value>" <time-unit> or less',
    args={
        'stopwatch driver id': driver_arg(),
        'value': Argument('numeric value'),
        'time-unit': EnumArgument('', ['min', 'sec', 'ms'], 'time_unit'),
    },
    doc="""
        the stopwatch ["<stopwatch driver id>"] value should be "<value>" <time-unit> or less

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <value> (required): numeric value
        * <time-unit> (required): "min", "sec", "ms"
        """
)


then(
    'I put elapsed time of the stopwatch ["<stopwatch driver id>"] into "<variable>"',
    args={
        'stopwatch driver id': driver_arg(),
        'variable': Argument('variable name to put elapsed stopwatch time value'),
    },
    doc="""
        I put elapsed time of the stopwatch ["<stopwatch driver id>"] into "<variable>"

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <variable> (required): variable name to put elapsed stopwatch time value
        """
)


then(
    'I remember elapsed time of the stopwatch ["<stopwatch driver id>"] as "<variable>"',
    args={
        'stopwatch driver id': driver_arg(),
        'variable': Argument('variable name to put elapsed stopwatch time value'),
    },
    doc="""
        I remember elapsed time of the stopwatch ["<stopwatch driver id>"] as "<variable>"

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <variable> (required): variable name to put elapsed stopwatch time value
        """
)
