from driver.SqlDriver import SqlDriver
from util.spec import Spec, UseDriverArgument, InitDriverArgument, Argument, EnumArgument

spec = Spec('SQL',
            spec_id='Sql',
            imports="""
                from typing import Optional
                from driver.SqlDriver import SqlDriver
            """)
given = spec.given
when = spec.when
then = spec.then


def driver_arg():
    return UseDriverArgument('SQL connection to use, "db" by default', SqlDriver)


given(
    'DB ["<type>"] ["<version>"] connection to "<endpoint>" [as "<db driver instance id>"]',
    args={
        'type': Argument('MySQL, SQL Server, PostgreSQL, etc., type from environment by default', 'db_type'),
        'version': Argument('exact client library version to use, version from environment by default'),
        'endpoint': Argument('endpoint definition from environment to connect to'),
        'db driver instance id': InitDriverArgument('a shortcut to this connection, "db" by default', SqlDriver),
    },
    doc="""
        DB ["<type>"] ["<version>"] connection to "<endpoint>" [as "<db driver instance id>"]

        * <type> (optional): MySQL, SQL Server, PostgreSQL, etc., type from environment by default
        * <version> (optional): exact client library version to use, version from environment by default
        * <endpoint> (required): endpoint definition from environment to connect to
        * <db driver instance id> (optional): a shortcut to this connection, "db" by default
        """
)


when(
    'I execute query "<query>" [on "<db driver instance id>"]',
    args={
        'query': Argument('SQL queries to execute'),
        'db driver instance id': driver_arg(),
    },
    doc="""
        I execute query "<query>" [on "<db driver instance id>"]

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
)


when(
    'I wait while "<query>" [on "<db driver instance id>"] returns empty set',
    args={
        'query': Argument('SQL queries to execute'),
        'db driver instance id': driver_arg(),
    },
    doc="""
        I wait while "<query>" [on "<db driver instance id>"] returns empty set

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
)


when(
    'I wait unless "<query>" [on "<db driver instance id>"] returns empty set',
    args={
        'query': Argument('SQL queries to execute'),
        'db driver instance id': driver_arg(),
    },
    doc="""
        I wait unless "<query>" [on "<db driver instance id>"] returns empty set

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
)


then(
    'queries [on "<db driver instance id>"] should complete successfully',
    args={
        'db driver instance id': driver_arg(),
    },
    doc="""
        queries [on "<db driver instance id>"] should complete successfully

        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
)


then(
    'result set [on "<db driver instance id>"] should be "<results>"',
    args={
        'db driver instance id': driver_arg(),
        'results': Argument('referenced result set table - fixme: needs to be defined somehow'),
    },
    doc="""
        result set [on "<db driver instance id>"] should be "<results>"

        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <results> (required): referenced result set table - fixme: needs to be defined somehow
        """
)


then(
    '"<value>" should be in output [from "<db driver instance id>"]',
    args={
        'value': Argument('string to find in query result', can_be_empty=True),
        'db driver instance id': driver_arg(),
    },
    doc="""
        "<value>" should be in output [from "<db driver instance id>"]

        * <value> (required): string to find in query result
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
)


then(
    'I put the result set [from "<db driver instance id>"] into "<variable>" [as <type>]',
    args={
        'db driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
        'type': EnumArgument('type of the variable', ['json'], 'as_type'),
    },
    doc="""
        I put the result set [from "<db driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <type> (optional): "json"
        """
)

then(
    'I remember the result set [from "<db driver instance id>"] as "<variable>" [as <type>]',
    args={
        'db driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
        'type': EnumArgument('type of the variable', ['json'], 'as_type'),
    },
    doc="""
        I remember the result set [from "<db driver instance id>"] as "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <type> (optional): "json"
        """
)
